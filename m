Return-Path: <linux-gpio+bounces-13932-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 734559F44CC
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 08:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E8CD161A2F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 07:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933C317277F;
	Tue, 17 Dec 2024 07:08:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68BC171092
	for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2024 07:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734419286; cv=none; b=bc8Px5Dcm9kitCngc07n/s73IzH5WVrXHI4sPJz97KU/fSw1cUfpuVfEEfSQCSFBbP9jRtQVUU+WgB24iisBc1s853lfmeHlZyp3vJJmmpZiCAwrabGglc4OuMqgtJcKwb+Gzx+47nwvStrZq0HXgmjEOmLwjVOZH70SUQgt1vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734419286; c=relaxed/simple;
	bh=0cYUGOJCMk9hzrUYNGZJvUmOELe0ky4OpSutraZO9xY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=tCUSDy1i4q0JMWdv7LZzDAOf5lvUH/Dc1LYDVVsdZrS4J98V2VBbIsWzXf+sOuZKR40Ob0kgxZrNO6G/sBSpROXdOZzZFwVDhgXygHhpUzp67rIge+n+zvvMOY4+L0WxkbzM6qvvBU6JBSMyBB/Ar+cHjbftKXVaoA4iTpasz/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3abe7375ba6so101786495ab.3
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2024 23:08:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734419284; x=1735024084;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRDwN1zpEWcBzT1VaG16wQzKWgPiascUQWIG+YKo2t8=;
        b=Ka7jVzk6iOdCDYZ6/zlwNDuqHwFmngOW+g7svfUGdVuFrD9H7KJsAKS2Kq4b3Zv9Fr
         o8Ec+upP9bbH9RAlxmO+3cPMB0dR/Xs+vvcsQ1VoYE/4F5flEcOeGzlgVVZ6+E352Li/
         QNSQvoN/ICdiyMuQHBC13r2tRdizWgA3XYfWqJwys/wAFe/7LwY3iSsRVkn52z32hi5O
         UnipLqUEZnSVros0eFT4JGaR/ORG5OOzlOK9je+FOMYRvNqwqzl0ADFT4HlTU/PFSO2d
         bdpwMgh/tDozQq8H0Mf1vXjSpcCjdTQq+v7a0bKXeu+mBunkQoxWWJ1LhCvxWyEeXDat
         iwJA==
X-Forwarded-Encrypted: i=1; AJvYcCW0lL4F2if9aEjw7JLwgvsRTLd0Knaq+ETgQM3Igkfdf+WW3VRlumMmz2RSg12zNNYpthMuyRFR/TfU@vger.kernel.org
X-Gm-Message-State: AOJu0YzNq7/FsuS5rh9TYfvV1P7kcOyuMpm2AjBmlEeMBIJyAewupcDd
	u06e07bDF2I19Abxivfw0I7jP1pvgf2NcDN6bdHwDC8WMKxj/cN3tP6VAWwKfsnj102aLcPiQ8B
	ku2+Fdb911+5Xfa8RkZ7SXFcVWd1xbriAGV22oTy4Y7ZkwsqTAyep2wc=
X-Google-Smtp-Source: AGHT+IH3TVKzgzi+hMwYzO8I6JCvRep3STNawVlhYQTcJYYxYeDO/5IrYAcVZ0f3Eq89idW5DxD31qNagFQCCAtYbUD/FBjFNorF
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3b89:b0:3a7:dd62:e954 with SMTP id
 e9e14a558f8ab-3baccadd1edmr32269245ab.0.1734419284013; Mon, 16 Dec 2024
 23:08:04 -0800 (PST)
Date: Mon, 16 Dec 2024 23:08:03 -0800
In-Reply-To: <tencent_A2CD92F8865949AE6ED1AED2CC9327C50606@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67612353.050a0220.37aaf.014c.GAE@google.com>
Subject: Re: [syzbot] [gpio?] general protection fault in gpiolib_seq_stop
From: syzbot <syzbot+b95d0c98f01e7a95da72@syzkaller.appspotmail.com>
To: brgl@bgdev.pl, eadavis@qq.com, linus.walleij@linaro.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING: lock held when returning to user space in gpiolib_seq_start

RBP: 00007fe66f38b090 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000005 R11: 0000000000000246 R12: 0000000000000001
R13: 0000000000000000 R14: 00007fe66e775fa0 R15: 00007ffe92372dd8
 </TASK>
================================================
WARNING: lock held when returning to user space!
6.12.0-syzkaller-10299-gc1f7eb90d8d5 #0 Not tainted
------------------------------------------------
syz.0.18/6685 is leaving the kernel with locks still held!
1 lock held by syz.0.18/6685:
 #0: ffffffff8e96d590 (gpio_devices_srcu){.+.+}-{0:0}, at: srcu_lock_acquire include/linux/srcu.h:158 [inline]
 #0: ffffffff8e96d590 (gpio_devices_srcu){.+.+}-{0:0}, at: srcu_read_lock include/linux/srcu.h:249 [inline]
 #0: ffffffff8e96d590 (gpio_devices_srcu){.+.+}-{0:0}, at: gpiolib_seq_start+0x13e/0x270 drivers/gpio/gpiolib.c:5039


Tested on:

commit:         c1f7eb90 fs/seq_file: Exit the subsequent process when..
git tree:       https://github.com/ea1davis/linux gpio/syz
console output: https://syzkaller.appspot.com/x/log.txt?x=12dfb4f8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e8d97faf7b870c89
dashboard link: https://syzkaller.appspot.com/bug?extid=b95d0c98f01e7a95da72
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.

