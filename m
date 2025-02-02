Return-Path: <linux-gpio+bounces-15179-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED54A24E09
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Feb 2025 13:46:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFD363A4930
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Feb 2025 12:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F531D6DB6;
	Sun,  2 Feb 2025 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ottse+9B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D741156885
	for <linux-gpio@vger.kernel.org>; Sun,  2 Feb 2025 12:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738500374; cv=none; b=MB7ElxQowntc/1rfc7F9mvktDCFdZg5VEgvUbP+H3nBX2t970J/yoR1RrRiNQUxjAn+uzIr0Fg6m3k+khz0txJR9G9PhJ1Vxfb0Dkh1FYymvBcJRyCcM1gbd3RTuZOQy8tGSA34aFoxMZxyE5HhejVEZhN8zALB3HRg9DjbRIXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738500374; c=relaxed/simple;
	bh=ZDO6wpNMU9RRwY7zeqHJeB3paV+3Hs4MB2W1s2LofnE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=rQPFkfewmMJes62WPUrjYzrQ+7O4y+RbXsaNa6Ba0QEbJvW+BFEo3dlF7uvMQzuJVo92Pi7Vi0syKiX4G5pH70EUY/oFZyve7e9qKP/06K0gxsJjiuZ6VJ8TG45LiiF5/Qun5ykP0aGV4purRHt3QmCE3dG9JR9njQGVOjJc3kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ottse+9B; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30613802a6bso36182661fa.1
        for <linux-gpio@vger.kernel.org>; Sun, 02 Feb 2025 04:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738500370; x=1739105170; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZDO6wpNMU9RRwY7zeqHJeB3paV+3Hs4MB2W1s2LofnE=;
        b=ottse+9Bx17hwaUJhJ7RPsNi+CzYOTv2vvsjt9gs2mFdiHqce/1iYmRx2tIV9qANMK
         FTRUpsvt+LvmP/hVsQzKlvd5v6uhPFHC9YloVLRgBq3vD1uvHODJndYWE8uNPC4uyZi9
         62IkBp7wEoefQeL8y9hiAWz991et+P/0crvHfYYbVuc5Hd5kisWt+XKc+dxQeU4NDX+t
         ZMZUAc5qmb93nogyUdA93JdSUSHILCDxwZyPK+hb5brD/VlYGDEJVmF+4NUDsUdDbnYL
         4deEqnUqhtrc8eAmeSNnOMCYuqyxn2QfpHxHl48rUf8taW0Vc3IJIIE73Bxo74gEVtGT
         QZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738500370; x=1739105170;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZDO6wpNMU9RRwY7zeqHJeB3paV+3Hs4MB2W1s2LofnE=;
        b=iifpBX8S7oERy/sZQNSsnZJKlJA6BOOyjljKiEToaSlZOdb+Yda+E7ptwAxD7FXmY/
         WkFuQi5FXHh9DRxYW76m5/E0duZJWru5MSZyvWFv+TgGdiG7xjhTlprvwIuh7Wgd2Zw+
         SZOLzTCLQ2nTwhe1+gz1wqnVmYl2JrEhVjmFSK12iEu8mgol6bys6gJRpU55HF3opsln
         LjwFHuDnUXgA5cvbXHjZhiiHV7ZY41WSGdVKWXjrgUL84SX1zcuEX/d55Q5g/8CY8alR
         VNoCNokE19VZm9unzSFM9wTrcGZjhC/+RI2rxN3PjXXNI5ORqCiHyBaQgufyh9qXXv9u
         CdqQ==
X-Gm-Message-State: AOJu0Yyf1/umsol51U77VLVs5biMu+9E2gzMBSJpYYqgQLCiIY2xcgrd
	04JTCt/1NEj/0nSGPNAANlUo2agxmasRTLe5r2NmX1H/cK1cLnUYAMDSgtXOkcMtHCaYX6FONB4
	SBVrTBEmU1Ur73qa+llaOIMJ1o3n18y89mvpU7g==
X-Gm-Gg: ASbGncsADJpWBwnQyB0rMotBfRT+COF0x/QH9xjjDCUzuzv21NOtTODO+6uT4jsuDHM
	+8F6m77MOzpn2VRjUzWwLsrImTz0ctZCD7RSKfYyCskZJEA7+qX2MN3f2GxHmhq+8Q7wZXsNOtg
	==
X-Google-Smtp-Source: AGHT+IHzHCOGlfdvddNebCngYM4/eIvseodmKtWlMoLVacB5hl4Rk40dGokwMeXnSG5bsaJPPrlEKXIIo52LrshbG/4=
X-Received: by 2002:a05:651c:1541:b0:2ff:e5fa:1ae7 with SMTP id
 38308e7fff4ca-307968f646dmr68317201fa.21.1738500369963; Sun, 02 Feb 2025
 04:46:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 2 Feb 2025 13:45:58 +0100
X-Gm-Features: AWEUYZllzY8CadonvGSLZs9pELHzgN38hLXrItcFXTGtm7vUU-qic-0bj1FC_vs
Message-ID: <CAMRc=McUCeZcU6co1aN54rTudo+JfPjjForu4iKQ5npwXk6GXA@mail.gmail.com>
Subject: Replacing global GPIO numbers in sysfs with hardware offsets
To: Linus Walleij <linus.walleij@linaro.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>, 
	Kent Gibson <warthog618@gmail.com>, =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>, 
	Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi!

I'll allow myself to start a thread about it before anyone invests a
significant amount of work into it. Yesterday (01.02.2025) during the
"embedded dinner" after the FOSDEM 2025 embedded devroom concluded, we
discussed the motivation behind my wish to remove /sys/class/gpio and
the reasons why many users prefer it over libgpiod or even a
user-space compatibility layer I presented during my talk earlier that
day[1].

The gist of it is: some people need to play with GPIOs very early, for
example in an initramfs that is very limited in size and doesn't
contain anything other than busybox so echoing into sysfs attributes
is preferable over trying to cram additional tools or even the entire
python interpreter into the limited system. An alternative to consider
is of course adding some limited GPIO functionality to busybox.

The main thing that bothers me in the GPIO sysfs class is not its
existence per se but the fact that it identifies individual GPIOs by
their global numbers and not hardware offsets which is the biggest
obstacle to removing the global numberspace and the legacy GPIO API
from the kernel.

I think it was Ahmad or Marek who suggested that users aren't really
attached to the global numbering but to the ease of use of sysfs.

I floated an idea of introducing a backward compatible change to sysfs
that would allow users to identify GPIOs by the label of their parent
chip and the hardware offset of the line within that chip (like what
we do for the character device) in the form of the export/unexport
pair of attributes inside the gpiochipXYZ directory associated with
given controller. These attributes, unlike the "global"
export/unexport would take the hardware offset and create the line
directory within the chip directory of which the layout would be the
same as that of its global counterpart (in fact: it could point to the
same directory in sysfs as a single line can only be requested once).

We could then encourage users to switch to using the chip-local
exports and eventually at least remove the global export/unexport pair
if we cannot make the entire sysfs class go away.

Please let me know what you think about it?

Bart

[1] https://fosdem.org/2025/schedule/event/fosdem-2025-5288-the-status-of-removing-sys-class-gpio-and-the-global-gpio-numberspace-from-the-kernel/

