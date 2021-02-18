Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72A7B31E41A
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Feb 2021 02:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbhBRBlc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Feb 2021 20:41:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbhBRBl2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Feb 2021 20:41:28 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C070C061574
        for <linux-gpio@vger.kernel.org>; Wed, 17 Feb 2021 17:40:47 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id u11so323440plg.13
        for <linux-gpio@vger.kernel.org>; Wed, 17 Feb 2021 17:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=CKLIplANtlw+H6KGkI3Gjb7Sm6V1BuDdC2WqPKVR28o=;
        b=NyrWCRrVdeblHxkXD443KkU6DLS2r2TVO+lZ67Iy4Z/Gmog7uNR2B09OY7kWELQkF9
         TbIgE892qHDVzWCoQesvVA654Ir3vOy+pZ+ntjhyRs3Rto9B/cPaugiiYALorMjPoyYg
         JKbYgHDnXNh69v2uoMJ6Opuqeg+eyXiALQxXwcAxt/qU5YjyuO6s1cIrhQkf59gPQwTY
         +Iyoqh424t0/2Lu58l0G56Iy3/EMiIQ6mlbm31XXupfpr4Ddh+SUuXjv8laXGYZfOsfa
         xEeI2AUTQ5eaDkBf8KFpevn/RD3nW/vTV+66u0uuPWg+D7TJkE8Gg+1a1yUh77UPGWAW
         FmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=CKLIplANtlw+H6KGkI3Gjb7Sm6V1BuDdC2WqPKVR28o=;
        b=S56Mwgmjn/R343XG8HDvTK8+r4ix50WWcNy9y70NluBwgYLKrBFgv2gdFlptCuf8JT
         vOlaSGgjWAc2P2/eXfpzVoiGxZggyQFq4WU9G4bvRwMFWCdqbAw7PcQHisH+T3PT48rP
         8DAxvNrngzlntU0muh0lTYdD6Xjuohz9arnIh17XUBWK6VLzvtGicgL0V3k2jW1/bCcH
         FjwIwuW1Kfvb7N6Kpzjx1aH/3EqFhWc0NZHopZvQW28P46cTC+bLAGRjbD3w9XsX1UKy
         h0mbvuOiiLIlEiYbpjKCo/mg8f5sEwXSPKTko7K0AWSmhq+xuN9sJBv+HaXh/4kZTMed
         ECwg==
X-Gm-Message-State: AOAM531Z/ZReb7XfusYsc/SNtbGAmyCS+viPux15J6V037L3bIVoiNIN
        /bEIHHBIfBMzXxkFNv/Gp5rUzjlCivHLkg==
X-Google-Smtp-Source: ABdhPJzqFmjhFD9nmmUjlR4Z2fe13hQ/TexRhqLt9en3UUtoJUm7VFt4ZYUOFe4d2EcSWfIbXo0pxA==
X-Received: by 2002:a17:902:b094:b029:e3:a2f:4681 with SMTP id p20-20020a170902b094b02900e30a2f4681mr1686569plr.69.1613612446657;
        Wed, 17 Feb 2021 17:40:46 -0800 (PST)
Received: from sol (106-69-179-46.dyn.iinet.net.au. [106.69.179.46])
        by smtp.gmail.com with ESMTPSA id i184sm435702pfe.19.2021.02.17.17.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 17:40:46 -0800 (PST)
Date:   Thu, 18 Feb 2021 09:40:42 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: strace 5.11 released - now decodes GPIO ioctls
Message-ID: <20210218014042.GC12952@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Just a quick note that, as of v5.11, strace now supports decoding of GPIO
cdev ioctls, both v1 and v2.

Cheers,
Kent.

----- Forwarded message from "Dmitry V. Levin" <ldv@altlinux.org> -----

Date: Wed, 17 Feb 2021 20:15:26 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: strace-devel@lists.strace.io
Subject: strace 5.11 released

Starting with version 4.13, strace follows the schedule of linux kernel
and new versions of strace are released along with new versions of linux
kernel, so strace 5.11 is tagged and uploaded.

$ git tag -v v5.11 2> /dev/null | sed -n '/^$/,$p'

Noteworthy changes in strace 5.11 (2021-02-17)
==============================================

* Improvements
  * Implemented poke injection (--inject=SET:poke_enter= and
    --inject=SET:poke_exit= options).
  * Implemented decoding of epoll_pwait2 syscall introduced in Linux 5.11.
  * Implemented decoding of GPIO_* ioctl commands.
  * Implemented decoding of FS_IOC_FS[GS]ETXATTR, FS_IOC_[GS]ETFLAGS,
    and FS_IOC32_[GS]ETFLAGS ioctl commands.
  * Implemented decoding of SIOCADDMULTI, SIOCDELMULTI, SIOCGIFENCAP,
    SIOCOUTQNSD, SIOCSIFENCAP, and SIOCSIFHWBROADCAST ioctl commands.
  * Implemented decoding of UBI_IOCRPEB and UBI_IOCSPEB ioctl commands.
  * Implemented decoding of V4L2_BUF_TYPE_META_CAPTURE,
    V4L2_BUF_TYPE_META_OUTPUT, and VIDIOC_QUERY_EXT_CTRL ioctl commands.
  * Updated lists of BPF_*, BTRFS_*, CLOSE_RANGE_*, ETH_*, IORING_*, KVM_*,
    PR_*, PTRACE_*, RTA_*, RTAX_*, RTM_*, RTNH_*, SCTP_*, SO_*, SYS_*, UFFD_*,
    and V4L2_* constants.
  * Updated lists of ioctl commands from Linux 5.11.

* Bug fixes
  * Fixed decoding of SIOCGIFINDEX, SIOCBRADDIF, and SIOCBRDELIF ioctl commands.
  * Fixed decoding of FIO[GS]ETOWN, SIOC[GS]PGRP, and SIOCATMARK ioctl commands
    on alpha, mips, sh, and xtensa architectures.
  * Fixed fork--pidns-translation test on sparc and sparc64.
  * Fixed build on hppa with uapi headers from Linux >= 5.10.

Contributors
============

This release was made possible by the contributions of many people.
The maintainers are grateful to everyone who has contributed
changes or bug reports.  These include:

* Dmitry V. Levin
* Elvira Khabirova
* Eugene Syromyatnikov
* Gleb Fotengauer-Malinovskiy
* Kent Gibson
* Philippe De Muyter
* Sven Schnelle

Please refer to the CREDITS file for the full list of strace contributors.

-- 
ldv



-- 
Strace-devel mailing list
Strace-devel@lists.strace.io
https://lists.strace.io/mailman/listinfo/strace-devel


----- End forwarded message -----
