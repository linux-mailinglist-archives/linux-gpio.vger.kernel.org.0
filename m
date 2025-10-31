Return-Path: <linux-gpio+bounces-27903-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F27C258FF
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 15:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7991B4F238E
	for <lists+linux-gpio@lfdr.de>; Fri, 31 Oct 2025 14:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCA5343D86;
	Fri, 31 Oct 2025 14:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infotecs.ru header.i=@infotecs.ru header.b="X3hIl6qF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0.infotecs.ru (mx0.infotecs.ru [91.244.183.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AC0224B1B;
	Fri, 31 Oct 2025 14:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.244.183.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761920705; cv=none; b=LC//VZkvPbe+RtpcBlpGz5abHpAnA5GskIW4xZiIp56UqKRAwnMrPggtUXy6ZjeyJhJZ7oR/3278ZcjdZP5BwhaR65N1+xWUhH4ZtYdBPvFxHgFEUunovGIUjG9ftp6jnJVzWLw2z0ES5/8zSfz2DiliaLj7pSsQG1IHaPApJhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761920705; c=relaxed/simple;
	bh=+dR8LqYFVT19rB3T1VlHprmvJN/ZY1eeJ5SNnvu+yHE=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=WHwl//oO/VJqvmlDhjbNeHb/d/rBizoz5CzdVax08u3rQWHhIYjxb6BqdIODSUiyB0wkuSO06rtB203x+OCxoCZsYFuVqdneXJeCrCn8kiTvn5qn2g5X8DwTdnEsZlgVr3vWENJtECaa+vFrLPFG2iduPuNtbUmjiQXLskiknGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=infotecs.ru; spf=pass smtp.mailfrom=infotecs.ru; dkim=pass (1024-bit key) header.d=infotecs.ru header.i=@infotecs.ru header.b=X3hIl6qF; arc=none smtp.client-ip=91.244.183.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=infotecs.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infotecs.ru
Received: from mx0.infotecs-nt (localhost [127.0.0.1])
	by mx0.infotecs.ru (Postfix) with ESMTP id 6AA3610F3583;
	Fri, 31 Oct 2025 17:24:50 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx0.infotecs.ru 6AA3610F3583
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infotecs.ru; s=mx;
	t=1761920690; bh=pGzQ6kimm+/DeoMRD1FTfHpDg0coh7GojPD7fvrvnAk=;
	h=From:To:CC:Subject:Date:From;
	b=X3hIl6qFE3RVLlHyk4WYo5B4cXO7EWXBalK5mKt3GkVKqi/jOvaDY7WO6MotWZ08K
	 uJEAY1P2tf7Q2MPqtNIUDkVQ1uuyq+GhV+uiAorR+lq092P/d2WGddnX4c6pii5mjV
	 Vw/zRBUvfZzOUqpkeNn2pjuMJ40wrnmIpg60LNIA=
Received: from msk-exch-02.infotecs-nt (msk-exch-02.infotecs-nt [10.0.7.192])
	by mx0.infotecs-nt (Postfix) with ESMTP id 680D931057D4;
	Fri, 31 Oct 2025 17:24:50 +0300 (MSK)
From: Ilia Gavrilov <Ilia.Gavrilov@infotecs.ru>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "lvc-project@linuxtesting.org"
	<lvc-project@linuxtesting.org>,
	"syzbot+b95d0c98f01e7a95da72@syzkaller.appspotmail.com"
	<syzbot+b95d0c98f01e7a95da72@syzkaller.appspotmail.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: [PATCH] gpiolib: Fix a null-ptr-deref in gpiolib_seq_stop()
Thread-Topic: [PATCH] gpiolib: Fix a null-ptr-deref in gpiolib_seq_stop()
Thread-Index: AQHcSnIdMP+aip/9Pkix0VizLaSbyg==
Date: Fri, 31 Oct 2025 14:24:50 +0000
Message-ID: <20251031142449.1969807-1-Ilia.Gavrilov@infotecs.ru>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-exclaimer-md-config: 208ac3cd-1ed4-4982-a353-bdefac89ac0a
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-KLMS-Rule-ID: 5
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Status: not scanned, disabled by settings
X-KLMS-AntiSpam-Interceptor-Info: not scanned
X-KLMS-AntiPhishing: Clean, bases: 2025/10/31 13:36:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2025/10/31 11:38:00 #27817028
X-KLMS-AntiVirus-Status: Clean, skipped

Syzkaller reports a null-ptr-deref in gpiolib_seq_stop() [1]

If the memory allocation for priv variable in gpiolib_seq_start() fails,
then s->private remains uninitialized, which leads to a null pointer
dereference to s->private in gpiolib_seq_stop().

[1]
Oops: general protection fault, probably for non-canonical address 0xdffffc=
0000000000: 0000 [#1] PREEMPT SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 1 UID: 0 PID: 10120 Comm: gpio_seq_stop Not tainted 6.12.53 #4
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1=
.16.2-1 04/01/2014
RIP: 0010:gpiolib_seq_stop+0x4c/0xd0
Code: 48 c1 ea 03 80 3c 02 00 0f 85 95 00 00 00 48 8b 9b e0 00 00 00 48 b8 =
00 00 00 00 00 fc ff df 48 8d 7b 04 48 89 fa 48 c1 ea 03 <0f> b6 14 02 48 8=
9 f8 83 e0 07 83 c0 03 38 d0 7c 04 84 d2 75 5d 8b
RSP: 0018:ffffc90019f2fad8 EFLAGS: 00010247
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000400
RDX: 0000000000000000 RSI: ffffffff84c57bfe RDI: 0000000000000004
RBP: 0000000000000000 R08: 0000000000000dc0 R09: 00000000ffffffff
R10: ffffffff8e3865b3 R11: 0000000000000001 R12: 0000000000000000
R13: ffffffff8bd9da80 R14: 0000000000010000 R15: 0000000000000000
FS:  00007fb9a07cf6c0(0000) GS:ffff888131600000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000004c2018 CR3: 00000000264c6000 CR4: 00000000000006f0
Call Trace:
 <TASK>
 seq_read_iter+0x610/0x1290
 seq_read+0x3a4/0x570
 ? __pfx_seq_read+0x10/0x10
 full_proxy_read+0x12a/0x1a0
 ? __pfx_full_proxy_read+0x10/0x10
 vfs_read+0x1e2/0xcf0
 ? __fget_files+0x23a/0x3f0
 ? __pfx_lock_release+0x10/0x10
 ? fdget_pos+0x24c/0x360
 ? __pfx_vfs_read+0x10/0x10
 ? __pfx___mutex_lock+0x10/0x10
 ? __fget_files+0x244/0x3f0
 ksys_read+0x12f/0x260
 ? __pfx_ksys_read+0x10/0x10
 do_syscall_64+0xcd/0x230
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Found by InfoTeCS on behalf of Linux Verification Center
(linuxtesting.org) with Syzkaller

Fixes: e348544f7994 ("gpio: protect the list of GPIO devices with SRCU")
Reported-by: syzbot+b95d0c98f01e7a95da72@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3Db95d0c98f01e7a95da72
Cc: stable@vger.kernel.org # 6.9+
Signed-off-by: Ilia Gavrilov <Ilia.Gavrilov@infotecs.ru>
---
 drivers/gpio/gpiolib.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9952e412da50..13cf9f4bdc6d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5298,7 +5298,7 @@ static void *gpiolib_seq_start(struct seq_file *s, lo=
ff_t *pos)
=20
 	priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
=20
 	s->private =3D priv;
 	if (*pos > 0)
@@ -5331,8 +5331,11 @@ static void gpiolib_seq_stop(struct seq_file *s, voi=
d *v)
 {
 	struct gpiolib_seq_priv *priv =3D s->private;
=20
-	srcu_read_unlock(&gpio_devices_srcu, priv->idx);
-	kfree(priv);
+	if (!IS_ERR(v)) {
+		srcu_read_unlock(&gpio_devices_srcu, priv->idx);
+		kfree(priv);
+	}
+	s->private =3D NULL;
 }
=20
 static int gpiolib_seq_show(struct seq_file *s, void *v)
--=20
2.39.5

