Return-Path: <linux-gpio+bounces-38858-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ebohNl2kO2r/aggAu9opvQ
	(envelope-from <linux-gpio+bounces-38858-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 11:33:17 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 360C36BCF8F
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 11:33:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=ZgbiECRU;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38858-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38858-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87FB53061B78
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2026 09:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F12C3B3BF4;
	Wed, 24 Jun 2026 09:27:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A32339C01E
	for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2026 09:27:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782293254; cv=none; b=kFzGg6hEV2afA06t/N5I9kvZNkBnBjOBpULhJB2hQZ2b+bltnahzPiCRo6c2QM2vFu0SpYrtKS9ff6N22ihOtibL9ki27oAxiVrl7T4O5EFDGhoKtujALJrN1bMKv23zKKikmzm7bkMGkMp+i64LPix5GtU+GNF9p8XuDQMg3cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782293254; c=relaxed/simple;
	bh=8b8md/ocwX2M97AjGtOw5SUqWzc54jmNps0F5z6p/xY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c/xWXSuh7/32eyjbqKRXk+cvEyzkU9jUJrg2pYwy/Bam+m9ggMZBdxbvWn8Pv8q00vFRd3Ij9WyWItezWjpgEUqhCVkBTDN6e6kPLgEnfZTvbS/YqfGg1CWfz6H6ovHHSHdwqJuyq9w0PHEOm/VsvrhL+KqA+k0mEUCDMVIDZHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ZgbiECRU; arc=none smtp.client-ip=220.197.31.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=cv
	AQPYLmfbILwihwpKiKuDgiLzCeWRJhEiRXEBQiCTQ=; b=ZgbiECRUIDpjOes5A4
	W1fruj5YZ4akaDT+VsefdoU8JxZHS/7yy32l601r1xgRizvAkr93KhJ5mtsTWD66
	9995mbsNLgfUGxjQ4LX1N+RTRXwIPt3V9h5sou5+tw19nWfqBCWFA5x6Oo6ql/zB
	CYI/mOxZMJ6xHbn88S1KqLeNY=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCXX73HojtqsfZ8Dw--.43312S2;
	Wed, 24 Jun 2026 17:26:32 +0800 (CST)
From: fffsqian@163.com
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	hpa@zytor.com,
	Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Brian Gerst <brgerst@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>
Subject: [PATCH 1/1] x86/vm86: fix vm86 struct leak on copy_from_user() failure
Date: Wed, 24 Jun 2026 17:26:29 +0800
Message-Id: <20260624092629.271618-1-fffsqian@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgCXX73HojtqsfZ8Dw--.43312S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw4kKr1fWrWDAF4kXr4fKrg_yoWrWF48pF
	WrW3sxCr4rXr1I9rn5tFs5urySkw10va1UCryktw1Fvr1ftr1DZF90ya4jv3y5AF1fCr4f
	ta90y3W5Z3yqqaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnb18UUUUU=
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbC6ghED2o7osiAjgAA3c
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38858-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[fffsqian@163.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:kees@kernel.org,m:luto@kernel.org,m:brgerst@gmail.com,m:linux-gpio@vger.kernel.org,m:fuqingshuang@kylinos.cn,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fffsqian@163.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[163.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 360C36BCF8F

From: Qingshuang Fu <fuqingshuang@kylinos.cn>

When copy_from_user() fails during vm86 setup in do_sys_vm86(),
the newly allocated vm86 structure is not freed, leading to a
memory leak that can be exploited by users with appropriate
privileges to cause DoS through resource exhaustion.

The leak occurs in multiple error paths after kzalloc_obj()
successfully allocates the vm86 structure and assigns it to
tsk->thread.vm86. Subsequent copy_from_user() failures for
vm86_struct, int_revectored, int21_revectored, or vm86plus data
leave the allocated memory orphaned.

Fix this by introducing a 'newly_allocated' boolean to distinguish
between newly created and pre-existing vm86 contexts. Use a
centralized cleanup path via goto to properly release memory in
all error scenarios while preserving existing vm86 states.

Security impact: This memory leak can lead to system DoS via OOM if
exploited by unprivileged local users, provided the system has
mmap_min_addr set to 0. The regression was introduced in commit
9fda6a0681e0 ("x86/vm86: Move vm86 fields out of 'thread_struct'") back
in 2015, and affects all 32-bit x86 kernels built with CONFIG_VM86
enabled.

Fixes: 9fda6a0681e0 ("x86/vm86: Move vm86 fields out of 'thread_struct'")
Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
---
 arch/x86/kernel/vm86_32.c | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kernel/vm86_32.c b/arch/x86/kernel/vm86_32.c
index b4c1cabc7a4b..cde077f2c97e 100644
--- a/arch/x86/kernel/vm86_32.c
+++ b/arch/x86/kernel/vm86_32.c
@@ -202,7 +202,8 @@ static long do_sys_vm86(struct vm86plus_struct __user *user_vm86, bool plus)
 	struct vm86 *vm86 = tsk->thread.vm86;
 	struct kernel_vm86_regs vm86regs;
 	struct pt_regs *regs = current_pt_regs();
-	unsigned long err = 0;
+	bool newly_allocated = false;
+	long err = 0;
 	struct vm86_struct v;
 
 	err = security_mmap_addr(0);
@@ -235,20 +236,24 @@ static long do_sys_vm86(struct vm86plus_struct __user *user_vm86, bool plus)
 		if (!(vm86 = kzalloc_obj(*vm86)))
 			return -ENOMEM;
 		tsk->thread.vm86 = vm86;
+		newly_allocated = true;
 	}
 	if (vm86->saved_sp0)
 		return -EPERM;
 
 	if (copy_from_user(&v, user_vm86,
-			offsetof(struct vm86_struct, int_revectored)))
-		return -EFAULT;
+			offsetof(struct vm86_struct, int_revectored))) {
+		err = -EFAULT;
+		goto cleanup;
+	}
 
 
 	/* VM86_SCREEN_BITMAP had numerous bugs and appears to have no users. */
 	if (v.flags & VM86_SCREEN_BITMAP) {
 		pr_info_once("vm86: '%s' uses VM86_SCREEN_BITMAP, which is no longer supported\n",
 			     current->comm);
-		return -EINVAL;
+		err = -EINVAL;
+		goto cleanup;
 	}
 
 	memset(&vm86regs, 0, sizeof(vm86regs));
@@ -275,16 +280,22 @@ static long do_sys_vm86(struct vm86plus_struct __user *user_vm86, bool plus)
 
 	if (copy_from_user(&vm86->int_revectored,
 			   &user_vm86->int_revectored,
-			   sizeof(struct revectored_struct)))
-		return -EFAULT;
+			   sizeof(struct revectored_struct))) {
+		err = -EFAULT;
+		goto cleanup;
+	}
 	if (copy_from_user(&vm86->int21_revectored,
 			   &user_vm86->int21_revectored,
-			   sizeof(struct revectored_struct)))
-		return -EFAULT;
+			   sizeof(struct revectored_struct))) {
+		err = -EFAULT;
+		goto cleanup;
+	}
 	if (plus) {
 		if (copy_from_user(&vm86->vm86plus, &user_vm86->vm86plus,
-				   sizeof(struct vm86plus_info_struct)))
-			return -EFAULT;
+				   sizeof(struct vm86plus_info_struct))) {
+			err = -EFAULT;
+			goto cleanup;
+		}
 		vm86->vm86plus.is_vm86pus = 1;
 	} else
 		memset(&vm86->vm86plus, 0,
@@ -340,6 +351,13 @@ static long do_sys_vm86(struct vm86plus_struct __user *user_vm86, bool plus)
 
 	memcpy((struct kernel_vm86_regs *)regs, &vm86regs, sizeof(vm86regs));
 	return regs->ax;
+
+cleanup:
+	if (newly_allocated) {
+		tsk->thread.vm86 = NULL;
+		kfree(vm86);
+	}
+	return err;
 }
 
 static inline void set_IF(struct kernel_vm86_regs *regs)

base-commit: 840ef6c78e6a2f694b578ecb9063241c992aaa9e
-- 
2.25.1


