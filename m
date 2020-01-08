Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0EE133DC5
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2020 10:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgAHJD0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 04:03:26 -0500
Received: from mail-io1-f47.google.com ([209.85.166.47]:37264 "EHLO
        mail-io1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgAHJDZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jan 2020 04:03:25 -0500
Received: by mail-io1-f47.google.com with SMTP id k24so2394146ioc.4
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jan 2020 01:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vhYF90l3L+96P5E+mNEGS0Q+1aKaByBu1sSjUBvwUUQ=;
        b=NQCrb7TdAlrmznHwrkn1kwnhsmJz/gI427LBKAfHHeUfPklhJEsKUgU+/as0qBrQlb
         u6QrPYPdpOdZg1RDmCgANS4V7O9Bo0CW8MLHKLaksulfMOan8M3GZQN4F7UxrOpi7kZD
         fIOjpwfkfoapAG4JLyZOsR5f1VcWFMu2gXJKNFAlBZpWzcGCKMoxEtxqzKQLfQejaYPk
         6h2bxjIM1EGdodg79OoQACbfgvRE4nlW3Ij+A+4SuWT1BJoq1nDYMITKvSHq/Tdi/zAm
         0WwHmoRn6Yf1JhSk3Y+yvqCMcIaG+CwXBK1Gr4+IIv8RuBdAHrINVFA4GHAPdYrjbdU/
         IOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vhYF90l3L+96P5E+mNEGS0Q+1aKaByBu1sSjUBvwUUQ=;
        b=Mgjw/taaZxjJ2MIR9EBsDnbbwNOtLpQPsmnf+2ZcXuB9aSkq1tNCSsG0oeVC9ruxRG
         zEvkWDJqaC6Pj4n5jiJNgyGiVCdzUEB+hqCxcef6zs/KubxxWlTXZwnLYVHZ4FiezzDA
         Oq5NyabsKqdiZLXZbBKDAmI1h65s4YKGySS5EuxNwCsaxmeSH8H3PE6sgV3SdaAZ+o39
         8B4ESZkAOl8dNkdcJeVg3oT5O/fpGIHxlLHhYJS4T9UZwhqQKGPfUmW05H6bVBQvWw8E
         szzHqUUeYEemPiGfdgQ7GLreSQnkJsST03wyZinJzAZwhsb8nx9EX+/gmM7Ptd05lHPQ
         +QOA==
X-Gm-Message-State: APjAAAU9OMMDHmMk1N9g+uufaQFl7lIWIXrF5lzkyp/fk69UT58ZZK+b
        8rJ+Uf9DTbzU6KeaBS2sOUBqG69YLC+TTCqCZMEIYFME0A4=
X-Google-Smtp-Source: APXvYqybchtl4hISaXm2OwuiM4U/X/+BEZqOCkumq+ThWgVgoa4ErlmbcrvQS1rI66Ktn3H4ES7cHaeIaKp+kS1gEns=
X-Received: by 2002:a05:6638:72c:: with SMTP id j12mr3335279jad.136.1578474205050;
 Wed, 08 Jan 2020 01:03:25 -0800 (PST)
MIME-Version: 1.0
References: <CAEzB2cvnh4SGVv8y0_roK=mngHGR=GBzKkwn9ATxF2+9K4SD3Q@mail.gmail.com>
In-Reply-To: <CAEzB2cvnh4SGVv8y0_roK=mngHGR=GBzKkwn9ATxF2+9K4SD3Q@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 8 Jan 2020 10:03:14 +0100
Message-ID: <CAMRc=McR6XAvW+2Uafc-TG5YYnkBFah-V+P7iF-yL3iv9c3YTQ@mail.gmail.com>
Subject: Re: [libgpiod] segfault with function gpiod_chip_get_all_lines(chip, &bulk);
To:     John Rose <ohimg801@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pt., 27 gru 2019 o 22:44 John Rose <ohimg801@gmail.com> napisa=C5=82(a):
>
> SBC:    HardKernel Odroid N2 4Gb.
> OS:     Ubuntu 18.04.3 Mate' DE.
>         Linux odroid_N2 4.9.196-63 #1 SMP PREEMPT Thu Oct 17 00:44:03
> -03 2019 aarch64 aarch64 aarch64 GNU/Linux
> ------------------------------------------------------
> A basic test of the gpiod_chip_get_all_lines function.
> ------------------------------------------------------
> /*--+----+----+----+----+----+----+----+----+----+----+----+----+----+---=
-+----+----+----+----+----+----+----+----+----+----+----+
>  * libgpio_test_03
>  *
>  *
>  *
>  */
> /*******gdb debugger
> error********************************************************************=
************************************
> t3st3r1@odroid_N2:~$ sudo gdb c_projects/libgpio_test_03/main
> GNU gdb (Ubuntu 8.1-0ubuntu3.2) 8.1.0.20180409-git
> Copyright (C) 2018 Free Software Foundation, Inc.
> License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.h=
tml>
> This is free software: you are free to change and redistribute it.
> There is NO WARRANTY, to the extent permitted by law.  Type "show copying=
"
> and "show warranty" for details.
> This GDB was configured as "aarch64-linux-gnu".
> Type "show configuration" for configuration details.
> For bug reporting instructions, please see:
> <http://www.gnu.org/software/gdb/bugs/>.
> Find the GDB manual and other documentation resources online at:
> <http://www.gnu.org/software/gdb/documentation/>.
> For help, type "help".
> Type "apropos word" to search for commands related to "word"...
> Reading symbols from c_projects/libgpio_test_03/main...done.
> (gdb) run
> Starting program: /home/t3st3r1/c_projects/libgpio_test_03/main
> OdroidN2 -- Ubuntu 18.04.3 LTS
> libgpio_test_03
>
> gpiod_chip_open() OK.
>
>
> Program received signal SIGSEGV, Segmentation fault.
> 0x0000007fb7fa48d0 in gpiod_line_bulk_add (line=3D0x555556a910,
> bulk=3D0x7ffffff2a0) at ../include/gpiod.h:578
> 578 bulk->lines[bulk->num_lines++] =3D line;
> (gdb)

The problem seems to be gone in current master. I get the following output:

---
OdroidN2 -- Ubuntu 18.04.3 LTS
libgpio_test_03

gpiod_chip_open() OK.

Exiting.
---

Bartosz
