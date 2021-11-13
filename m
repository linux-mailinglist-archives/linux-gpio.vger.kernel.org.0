Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6948044F50E
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Nov 2021 20:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233898AbhKMTtk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 13 Nov 2021 14:49:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233692AbhKMTtk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 13 Nov 2021 14:49:40 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92307C061766;
        Sat, 13 Nov 2021 11:46:47 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id l8so12339281ilv.3;
        Sat, 13 Nov 2021 11:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=q0pW/4SZQfcs9fB3+2D2UZECvYnIw9zgslfHYJWgEMU=;
        b=ekf8g1eT2p9OWdenOZ7dzbLiKh9wa5uD+rYdhY1iurcQn40xes12kTY3adJc9h4HNQ
         QHS1jCb6iLntzWzFzDrT/K/Q1zYuvDVrwFFq7/qbUsqNzPD8WGYNuKE8Rmvte9e3vFf1
         IrSD7/Y/fMi8xZyaPFMg0SHVmRkpUbUDudOvPQfIaNLk+iE+ANiepReWT1T9gPzUcd0w
         NM09+o1r3G4xvixka2zW+Z1ee+tw/TjbeyMKmHKshUWWNdCCU10HyLa+Vx1KLxbSWQBE
         4f/Ou4GyFMjEvz0Mb6DnFSA3duoP1wrrRPEaCwIhabivG82mbUQt0xe1vu5Te6X2e0fY
         dbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=q0pW/4SZQfcs9fB3+2D2UZECvYnIw9zgslfHYJWgEMU=;
        b=XB4qd9U8/Jk61EoKT8OkodYkc6FklMsJ/iZSte1rZ45rKBmUWYQEz+7LprPATDiqWw
         mmJtBLHayPgiud3hVYNqs3rEUij+apLZ0RUdhQKsa/2JjaS8F5qes0teVWyZmzfAO4FQ
         xVwpZ6tM9Esla/yKl6IXvJvJTmoQ4JYceS+ZsrgRRhMFZQyQymqSzmI3xTRmx10JfyJn
         DhOBBr+FTubkZdpGEYPNlghrNCmtxb7CcjhPCffXO3fbMSC4bMTlFyX8hJx4yOToHmb4
         0VLIPaypOp//gGFMOdx6jd5pRxy3vORSTV9DemL8wEGafkigqaZHtEjtVuPMzOwNMBZR
         vONA==
X-Gm-Message-State: AOAM53221GnQ/ZSj8DZnojD7PCWCEUfkmQ5mntd3NRhXsz4lm7im+0qK
        F4RA8iF7RIpggfGYl/M7X/PsENKVKrEh83OwvoqPlY9SXpQ=
X-Google-Smtp-Source: ABdhPJz+5fCcj/AvU+qC15x2V0vf8MH+GI4DaGssdfeV53CgzP+e5YcS+WZtmGosZeUpSOjskFgUb84YkWD3SStIc5E=
X-Received: by 2002:a05:6e02:1a0a:: with SMTP id s10mr14771925ild.161.1636832807041;
 Sat, 13 Nov 2021 11:46:47 -0800 (PST)
MIME-Version: 1.0
From:   =?UTF-8?Q?Pawe=C5=82_Metelski?= <pabou88@gmail.com>
Date:   Sat, 13 Nov 2021 20:46:25 +0100
Message-ID: <CAA6C2x9Snh0jzCT7Z4+m4kA+StCfsWtESPC1C0s-uKXB6_fJWw@mail.gmail.com>
Subject: New hardware support - ITE IT8689
To:     linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

I've got this new hardware, Gigabyte Z690 UD DDR5.
Apparently it employs a new SuperIO monitoring chip, an ITE IT8689:
[    1.626587] gpio_it87: Unknown Chip found, Chip 8689 Revision 1

I'm running gentoo-sources-5.14.17 but it also seems missing on upstream gi=
t.

I could probably test your patches quite easily (I suppose I just need
to build a module and load it, see dmesg output, try to spin up a fan,
see if hwmon reports it, etc.), I could also try to patch it myself
given a domain introduction (8y exp C dev, 0y exp kernel C dev).

--=20
Pozdrawiam,
Pawe=C5=82 Metelski
