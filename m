Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 822E11432CD
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2020 21:16:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgATUQc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jan 2020 15:16:32 -0500
Received: from mail-wm1-f42.google.com ([209.85.128.42]:54423 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726607AbgATUQb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jan 2020 15:16:31 -0500
Received: by mail-wm1-f42.google.com with SMTP id b19so621693wmj.4
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jan 2020 12:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=J4aN0dzaqMNRPWAjNSxCd0ROICxGQWQXbvxHhyPe/mM=;
        b=ZZY55E4IBTijzMwdMmSG0+SbwqxB5lTA4H+soRfCUToqSFviug8U79foI9suPdGwNW
         aJLeH3Tqam13BW1CheuCxu0ruKDupdiCTWPdt8FwpWJAv6TXt4J72NPd7peZk2h/H9rX
         hs2HLIqxY5LnJ3WtV3gy4IQnG+EuZrhM1xTficOoSPh7hMxgUNXIiDfw+K3g2GTF9ojp
         UuZpuIzmSh59D7oGmbVx6+7wiW7wfCVZRwQYyYlE8y6lc75eRipyY1tgCL1gJsvYon5A
         AnrFYSn8+zdeW9s1hZIymnVeBIzSuDJvEqHYyynGbr8LTXRNu0VZHOIFO2jVHXlgwlFz
         qtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=J4aN0dzaqMNRPWAjNSxCd0ROICxGQWQXbvxHhyPe/mM=;
        b=VZf1VAAAQYp+5UqoKzQTZGk6cxn9J/RK4y0tvCPm8NyB2l9lq6T6cehowjMXvHtX7w
         Oe4SLYm030PuLOkcI5Hvz+H34UEAfv57zpghDUL4mDX0WsHmTPp68hOdqYzhCP5ezG+s
         CROS3N1zxwv5TrbLtWWB3zuRcNLd++DpE06xdaoMgH3RFRVakBszEww+3mNAlW5rJ1ia
         Su01UOevkx4UUMmn7bMgPGKnyw0NbmSA7W6AU1EmtdvxJgYReVT7r+Rcht7ZxdIMAce0
         9/t6jXCp7bBzMjTHwMSxSDMUT/yv2QWPNYMZ4UeVwrALR62SGy6Gwn02PWE2dLnI7LYX
         AvSw==
X-Gm-Message-State: APjAAAXTDQV96RYShOvpAoLPlgxzo2QWM+vtUWcpqVXeBBD2i8w3WC+8
        zqipRCeYTh7pgEt9J+XLkI24BZRUVnvbUrz2qSChPg==
X-Google-Smtp-Source: APXvYqy5v/TQAuK+oNVnrvwuUZzxRYRuaSK1Ka9z6bzYEiGNCNrFs9JxohWcOMdlT/+Hju2oFkMQ76KC3QKNgNlqauY=
X-Received: by 2002:a7b:c3d7:: with SMTP id t23mr555922wmj.33.1579551389729;
 Mon, 20 Jan 2020 12:16:29 -0800 (PST)
MIME-Version: 1.0
References: <CAEzB2cvnh4SGVv8y0_roK=mngHGR=GBzKkwn9ATxF2+9K4SD3Q@mail.gmail.com>
 <CAMRc=McR6XAvW+2Uafc-TG5YYnkBFah-V+P7iF-yL3iv9c3YTQ@mail.gmail.com>
In-Reply-To: <CAMRc=McR6XAvW+2Uafc-TG5YYnkBFah-V+P7iF-yL3iv9c3YTQ@mail.gmail.com>
From:   John Rose <ohimg801@gmail.com>
Date:   Mon, 20 Jan 2020 14:16:18 -0600
Message-ID: <CAEzB2ctGMHnU1O2JPziCadak2mH4PKQtAwY-wT64n8Pt_4_tgw@mail.gmail.com>
Subject: Re: [libgpiod] segfault with function gpiod_chip_get_all_lines(chip, &bulk);
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Ok, thanks.

On Wed, Jan 8, 2020 at 3:03 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> pt., 27 gru 2019 o 22:44 John Rose <ohimg801@gmail.com> napisa=C5=82(a):
> >
> > SBC:    HardKernel Odroid N2 4Gb.
> > OS:     Ubuntu 18.04.3 Mate' DE.
> >         Linux odroid_N2 4.9.196-63 #1 SMP PREEMPT Thu Oct 17 00:44:03
> > -03 2019 aarch64 aarch64 aarch64 GNU/Linux
> > ------------------------------------------------------
> > A basic test of the gpiod_chip_get_all_lines function.
> > ------------------------------------------------------
> > /*--+----+----+----+----+----+----+----+----+----+----+----+----+----+-=
---+----+----+----+----+----+----+----+----+----+----+----+
> >  * libgpio_test_03
> >  *
> >  *
> >  *
> >  */
> > /*******gdb debugger
> > error******************************************************************=
**************************************
> > t3st3r1@odroid_N2:~$ sudo gdb c_projects/libgpio_test_03/main
> > GNU gdb (Ubuntu 8.1-0ubuntu3.2) 8.1.0.20180409-git
> > Copyright (C) 2018 Free Software Foundation, Inc.
> > License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl=
.html>
> > This is free software: you are free to change and redistribute it.
> > There is NO WARRANTY, to the extent permitted by law.  Type "show copyi=
ng"
> > and "show warranty" for details.
> > This GDB was configured as "aarch64-linux-gnu".
> > Type "show configuration" for configuration details.
> > For bug reporting instructions, please see:
> > <http://www.gnu.org/software/gdb/bugs/>.
> > Find the GDB manual and other documentation resources online at:
> > <http://www.gnu.org/software/gdb/documentation/>.
> > For help, type "help".
> > Type "apropos word" to search for commands related to "word"...
> > Reading symbols from c_projects/libgpio_test_03/main...done.
> > (gdb) run
> > Starting program: /home/t3st3r1/c_projects/libgpio_test_03/main
> > OdroidN2 -- Ubuntu 18.04.3 LTS
> > libgpio_test_03
> >
> > gpiod_chip_open() OK.
> >
> >
> > Program received signal SIGSEGV, Segmentation fault.
> > 0x0000007fb7fa48d0 in gpiod_line_bulk_add (line=3D0x555556a910,
> > bulk=3D0x7ffffff2a0) at ../include/gpiod.h:578
> > 578 bulk->lines[bulk->num_lines++] =3D line;
> > (gdb)
>
> The problem seems to be gone in current master. I get the following outpu=
t:
>
> ---
> OdroidN2 -- Ubuntu 18.04.3 LTS
> libgpio_test_03
>
> gpiod_chip_open() OK.
>
> Exiting.
> ---
>
> Bartosz
