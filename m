Return-Path: <linux-gpio+bounces-13936-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5BA9F4539
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 08:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FDAD1687E8
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 07:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D1017ADF7;
	Tue, 17 Dec 2024 07:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="BrNdMR3h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB10E208CA;
	Tue, 17 Dec 2024 07:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734421043; cv=none; b=XxnuZNEejyQSvdQqQk0A1PoIIsmRMlC/AH6QrTUCJmL15uZNB3Wy39Mc8X8tk+Q1YR9TRJRLZaequo4UyHDxnrR6GqBbV/87p36CdpPL4le/THjdisUoZWS/RqI0X9jUFhSyjpUHcF7cynGKtIKti3UxUpK7WR+pw4gdL6qYFws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734421043; c=relaxed/simple;
	bh=zDoqg0tW30oyc/en2/gcCsRZ/zKrXciAluzcJU9ZuRo=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=b8bwVU3UMjn6Wsw1Bun54Sk7xtQgd8ggHKZhEHbijxSFNGQTQx+L7RZ8VrzVkHtrvo8PE3YtRvFxfPWEDYFw0OPCLDPUmOWZbpxrKfrzt9jwurjTfBkJyb9fVBylbV6BLJkymtTqi6vxiO8WHrcxAQcTPs/hCAmRqaiOuH93LXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=BrNdMR3h; arc=none smtp.client-ip=203.205.221.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1734421033; bh=RpPRdrku20ZffiMFApn08Rq79PrP649J/NFxsl0e6LM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BrNdMR3h8C/xz5NRcNt/NAvH6QLudE6NFx4XQWHcHwtnbeUQwpwox3/NaPvtUf/vC
	 8lYmVS+OYN7TFuw2iKB+zIwDj0+EDYIoTPASgJDVS+BorCGjPnuYiX0moYSAxpZsmp
	 CMaJlMDiJRnH6eOkMbs3NF6IfpdjMHK6o36fZAuk=
Received: from pek-lxu-l1.wrs.com ([114.244.57.34])
	by newxmesmtplogicsvrszc25-0.qq.com (NewEsmtp) with SMTP
	id 94B35E3C; Tue, 17 Dec 2024 15:37:11 +0800
X-QQ-mid: xmsmtpt1734421031tqoyefvff
Message-ID: <tencent_9A6EC60CB9E7CC86D692D68663099CEEDA06@qq.com>
X-QQ-XMAILINFO: MYcyYH/A/+tCVe8oAgK9/Pwjlqp0ImLVsCtMnnsFShL2twKTwzHwT/W3USogOj
	 BInncZoE3ISCbKtv1Uda9nOfDqiKNtKj2TfBRgEVNyZEmyf9TW4KuoQtWjAx2J8mmQxrjhU9Ph/t
	 zEFSsy89v+eWw8ZL8bL7CtxjScQMjzBnJKNKynT2JZh31Fq4wFAvltmUYgsHgC9MJGTv4blbZ2l4
	 emM901PTppdJHcSBllrVoq5fGTcCwqWdn+2ddRDwDJO8tcJHS8f92XU3THtqcb8CurfWJPWdco4C
	 c/JaFjSpTpqstsON6g+QvRsAIGWzSB3PHaxgiyHhW3FOGBki6ZAINHeZ5iwLpy/XOfWVCKT6WiFA
	 nn7xIL1a5aoS4dmSo5PQvsnudC28hjwqwcCik6ZDB6jRTOwiToSrJ4Nel1y5mOwsgjJ3tRzebxbO
	 xnyQrLM1QxKaxXp/SqKuiI0pXz8vSjyUrFk852HjyGwE7p35pUdLAwquA9/exRPwy8mF3js6yFOm
	 6OYVrc6FcVs4auB+AGOh9O4gQTiUoq+dsjX0VdEmZQ5H0IRPNkL6YLXB65P+gWQFUs7m4roqtyU8
	 /INEVGDrWIqZ2LunZYpNwgIZXSRzspXjLMiLwgs5QwMu9PHGeS5C669GZ2wNLs0A91TZOz/weVwd
	 XmU8r2b00F7knljI3YdltduxyZbz+E5BWbYcvqHRH8uksBZlhCRKqeJU1K1kKumQHHAHcYcumZkk
	 1K66ZRLe6r1dfrpr+DM1jtZYugRk2MqCfLIr/hYCO08T++E8GQk02Ap68loRfr3b4X6xRQAPAjwt
	 CxCHVy2P9nYNy5Oy+eFGa3Sd7/BF4qgGikSnGJ9pvxEig8/WSq570HoS17Zbe6/vOXdEsoVDmOy3
	 JLreE+lnwtsttx99RyOmq0LnDNN/08xunkRRnDiZKP
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+b95d0c98f01e7a95da72@syzkaller.appspotmail.com
Cc: brgl@bgdev.pl,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] fs/seq_file: Exit the subsequent process when seq start fails
Date: Tue, 17 Dec 2024 15:37:12 +0800
X-OQ-MSGID: <20241217073711.2866877-2-eadavis@qq.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <67610786.050a0220.37aaf.0149.GAE@google.com>
References: <67610786.050a0220.37aaf.0149.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot report a null-ptr-deref in gpiolib_seq_stop. [1]

syzbot uses "echo 2 > /proc/thread-self/fail-nth", and in the current thread,
the second memory allocation will trigger a failure.
That is to say, the memory allocation for priv in gpiolib_seq_start() fails,
so m->private is not initialized, which eventually leads to a null pointer
dereference to m->private in gpiolib_seq_stop().

Because this type of problem is recurring, it is best to handle it in the
upper layer of the gpio driver, that is, in fs/seq_file.c, and judge the
pointer returned after m->op->start() returns. If its value is null, exit
the subsequent process.This failure does not affect the next execution of
traverse(), so 0 is returned here.

[1]
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 UID: 0 PID: 5829 Comm: syz-executor520 Not tainted 6.13.0-rc2-syzkaller-00362-g2d8308bf5b67 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/25/2024
RIP: 0010:gpiolib_seq_stop+0x4c/0xe0 drivers/gpio/gpiolib.c:5067
Code: 48 c1 ea 03 80 3c 02 00 0f 85 98 00 00 00 48 8b 9b e0 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d 7b 04 48 89 fa 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 04 84 d2 75 60 8b
RSP: 0018:ffffc90003e1fa58 EFLAGS: 00010247
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffff88802463a018
RDX: 0000000000000000 RSI: ffffffff84cc96be RDI: 0000000000000004
RBP: 0000000000000000 R08: 0000000000000dc0 R09: 00000000ffffffff
R10: ffffffff8df7c5d3 R11: 0000000000000001 R12: ffffffff8bb596a0
R13: 0000000000000000 R14: 0000000000000000 R15: ffffc90003e1fc40
FS:  0000555557ff9380(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055e43c381608 CR3: 0000000076408000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 traverse.part.0.constprop.0+0x2bd/0x640 fs/seq_file.c:131
 traverse fs/seq_file.c:98 [inline]
 seq_read_iter+0x934/0x12b0 fs/seq_file.c:195
 seq_read+0x39f/0x4e0 fs/seq_file.c:162
 full_proxy_read+0xfb/0x1b0 fs/debugfs/file.c:351
 vfs_read+0x1df/0xbe0 fs/read_write.c:563
 ksys_pread64 fs/read_write.c:756 [inline]
 __do_sys_pread64 fs/read_write.c:764 [inline]
 __se_sys_pread64 fs/read_write.c:761 [inline]
 __x64_sys_pread64+0x1f6/0x250 fs/read_write.c:761
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Reported-by: syzbot+b95d0c98f01e7a95da72@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b95d0c98f01e7a95da72
Tested-by: syzbot+b95d0c98f01e7a95da72@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 fs/seq_file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/seq_file.c b/fs/seq_file.c
index 8bbb1ad46335..130424bbcf7d 100644
--- a/fs/seq_file.c
+++ b/fs/seq_file.c
@@ -104,6 +104,9 @@ static int traverse(struct seq_file *m, loff_t offset)
 			return -ENOMEM;
 	}
 	p = m->op->start(m, &m->index);
+	if (!p && !m->private)
+		return 0;
+
 	while (p) {
 		error = PTR_ERR(p);
 		if (IS_ERR(p))
-- 
2.47.0


