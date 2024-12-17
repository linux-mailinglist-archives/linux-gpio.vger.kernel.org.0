Return-Path: <linux-gpio+bounces-13935-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DF09F4531
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 08:34:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2615D1685C3
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 07:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54ED518FDAF;
	Tue, 17 Dec 2024 07:34:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E95A15B0EE
	for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2024 07:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734420845; cv=none; b=riiykgZS88Ch/DoxTNLZX1uo7xEKMIho15Fz3XE7lhmKgmSry8pEzKVbt1Ju/zAii/Ta0dg1XPZ2+JjM3kvJTTbwonPI/kblsqkPmKCu/s4XSD5QLGmDljaTtYUnF2rZuFBojxhVg/a1bJIKoic3MA1ospJabwZZvlnn6hmKvTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734420845; c=relaxed/simple;
	bh=2qbBA8dB9rghq4JU3RMGDB0GWVpw/hyRn2QQ2R0T4xM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gZwtf6gu/aPZ8bMBYI5kam02AIs+I7btPdZxAjE6c6UH2t8shmemGHhtIkVHsMETCs1n1juwBgsaQCgahhKcmX/JlOEPsfT1Wc/p7deBrcTqzl6W6h0wyduRdKKL26SE/y+33MWWpZUmlCBEl/4epri+xrTUrDqgCMslNjaaCDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-844d02766ebso424603039f.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2024 23:34:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734420843; x=1735025643;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HuLku8nskRpw3kzYQNuILjeVKhjCyFHGbFaT7HP2LrI=;
        b=tblS3DR4REE8T38klL7UPPJiNUyCY1i7AoNtWO8vqIPpkOs3YE0OwkU5XXHD6OF6uA
         luCBm3HmtIXIdxYPwSFiyOWdZQ123oF716HiCT2YforE2V6bFb9Ot/1woHRE2Vl4+vqr
         RXqTOuqjQ8u+nU+B5UrVWuzqJGW/8y0+eWWqJudTBMTEkasHBShc4hiWY6TRhnMkFkck
         hOeAVHeeP0y6zL0I8Jwi1p0hj7Eu7oJG9ZNCXS5GXpE9o8Eo6xVjLNP2kDxy8GHp1WMo
         VYQ1JBuuMS6ocA2pf9hoZ0JozZ9fnRES0h2APphXTSXfusLShtTfc4h1lX0COA0YQuQS
         PI8w==
X-Forwarded-Encrypted: i=1; AJvYcCVaEXUDGcBcvAj//tGN1rdDw5pWecOrwypj+Y3GA8CqJci514b+uGaNPIQmYR9Gzi2TDFINV0h4SqFE@vger.kernel.org
X-Gm-Message-State: AOJu0YxwS2+5/ZI3CEO6ApPwTvhfH8E/bphjSnjnI0jf7AGM4FYsaGeu
	einHNronvZdsDdXNlpRZcDf7Z6xE+XR5r/vEP+8mpx9Dpo2hr7dN8IUKDZB57yuMNQsYf/C/mgq
	uxa77n206RA6nRbhu8/OjsXCivcURvgRaXgdQ7mszW7LJUO0uA67GwTw=
X-Google-Smtp-Source: AGHT+IFo/TPCM5xWBSv33m9vYQP8bmdBxGISBsKlat+NgM/LZ8KwcEUmUrH0UbBkstxz0B4kVTnwbnvSX+gQ93bUJ+Fn/RSKeiIg
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2408:b0:3a7:c5a6:9822 with SMTP id
 e9e14a558f8ab-3aff8c9255emr154827615ab.24.1734420842901; Mon, 16 Dec 2024
 23:34:02 -0800 (PST)
Date: Mon, 16 Dec 2024 23:34:02 -0800
In-Reply-To: <tencent_A3A5C98D8F1209DDBF5DFD997FCFD38D8507@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6761296a.050a0220.37aaf.014f.GAE@google.com>
Subject: Re: [syzbot] [gpio?] general protection fault in gpiolib_seq_stop
From: syzbot <syzbot+b95d0c98f01e7a95da72@syzkaller.appspotmail.com>
To: brgl@bgdev.pl, eadavis@qq.com, linus.walleij@linaro.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b95d0c98f01e7a95da72@syzkaller.appspotmail.com
Tested-by: syzbot+b95d0c98f01e7a95da72@syzkaller.appspotmail.com

Tested on:

commit:         36a3a495 fs/seq_file: Exit the subsequent process when..
git tree:       https://github.com/ea1davis/linux gpio/syz
console output: https://syzkaller.appspot.com/x/log.txt?x=160a8b44580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e8d97faf7b870c89
dashboard link: https://syzkaller.appspot.com/bug?extid=b95d0c98f01e7a95da72
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.

