Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4D2C482777
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jan 2022 13:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232358AbiAAMFy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Jan 2022 07:05:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232362AbiAAMFy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Jan 2022 07:05:54 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA806C061574
        for <linux-gpio@vger.kernel.org>; Sat,  1 Jan 2022 04:05:53 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id 8so25891578pgc.10
        for <linux-gpio@vger.kernel.org>; Sat, 01 Jan 2022 04:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=dhFaFNGf9P/hgzfpigNOAcNefTeR7Csml9+Bh/hdy/w=;
        b=fewJNFGd6mGjeBdckpOh/U2i/6NG+S2a3KHXTeW7v+sLQCeD1si2VRVwR1ClLHX2+W
         BDktQzixoCBlO6cjKxKrQkMOuyy3JPcMH1UF92l91WOwJAugvgtHz3TL7w9O5pXAIFJw
         wzmnvSfJ3IupSf2Aw4jorK132jMgOrqZoZeXEO7PoSwS/bT/PKlxkwHO6xAEnIVUYjmY
         GVrHHZadv4uhYMbItN8FPVqxbtm2XORjMDV4EfmPBGcA8mOPPZJDs+pBUqjaDAUez012
         RwY7SQI+byJkGLYM2+UyU2L3EnM7Dj+Gf0lKzmUTnrXXSb0eof24FIP8/iaKTI38Sm2U
         FYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=dhFaFNGf9P/hgzfpigNOAcNefTeR7Csml9+Bh/hdy/w=;
        b=NU7IQcSn++FMw+7teLLAnEvD8zMWqGA7c88dICdkBCkmHtHDlFNwhsOHwfHMXhMrtM
         +p+O4pwa7JG8NHm030PexeuZwPSczBKbT42HOKgwX0TQMnAkQwyXP7UkeuafwbI1fTPX
         uPIixz2IE8nsvfuSL2sEwC+KHpZKfyy6D8dPb/902oWxPh1mzabWoqjmWv3UeTxmfgQT
         IQB+6H/4FWRV6Ue6qyG7yc3C63YlVKyA6N+C/f5MJHNCMwPyTLUnogLibr2ZT/rkN0Me
         XNhYjLzPGNOlXKg0aQnwCRfvkcSHo6JUbIi2wtPktvuSORw5qULNPEWN60N2muXEkiao
         +nwQ==
X-Gm-Message-State: AOAM5330ubgCW/RdYAKViX4qppdpoDnVGV+VRICSCjJIylsiIm1L4Q0o
        2USNnFJl9V+feI3fkxhqBGc=
X-Google-Smtp-Source: ABdhPJxQK8HabqUcpS0YutoseFpreDCHnJ3w3ZQJP5Wh0ZzpAA7FqRwQn5lgayZDcu+wTRy/m7JiXw==
X-Received: by 2002:a63:1c1d:: with SMTP id c29mr34709874pgc.89.1641038753589;
        Sat, 01 Jan 2022 04:05:53 -0800 (PST)
Received: from [192.168.0.153] ([143.244.48.136])
        by smtp.gmail.com with ESMTPSA id kb1sm33652672pjb.45.2022.01.01.04.05.45
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Jan 2022 04:05:53 -0800 (PST)
Message-ID: <61d043a1.1c69fb81.e9f32.a16c@mx.google.com>
From:   yalaiibrahim818@gmail.com
X-Google-Original-From: suport.prilend@gmail.com
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: RE:
To:     Recipients <suport.prilend@gmail.com>
Date:   Sat, 01 Jan 2022 14:05:35 +0200
Reply-To: andres.stemmet1@gmail.com
X-Mailer: TurboMailer 2
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I want to confide in you to finalize this transaction of mutual benefits. I=
t may seem strange to you, but it is real. This is a transaction that has n=
o risk at all, due process shall be followed and it shall be carried out un=
der the ambit of the financial laws. Being the Chief Financial Officer, BP =
Plc. I want to trust and put in your care Eighteen Million British Pounds S=
terling, The funds were acquired from an over-invoiced payment from a past =
contract executed in one of my departments. I can't successfully achieve th=
is transaction without presenting you as foreign contractor who will provid=
e a bank account to receive the funds.

Documentation for the claim of the funds will be legally processed and docu=
mented, so I will need your full cooperation on this matter for our mutual =
benefits. We will discuss details if you are interested to work with me to =
secure this funds. I will appreciate your prompt response in every bit of o=
ur communication. Stay Blessed and Stay Safe.

Best Regards


Tel: +44 7537 185910
Andres  Stemmet
Email: andres.stemmet1@gmail.com  =

Chief financial officer
BP Petroleum p.l.c.

                                                                           =
                        Copyright =A9 1996-2021

