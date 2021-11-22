Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3EAD459526
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 19:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239142AbhKVS4S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Nov 2021 13:56:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237700AbhKVS4G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Nov 2021 13:56:06 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D649C061714
        for <linux-gpio@vger.kernel.org>; Mon, 22 Nov 2021 10:53:00 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso30203187otj.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Nov 2021 10:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=xSiQLbNK/sYaG2E1AGcq44IV1a0yKBL3nMRosKDHAUc=;
        b=dn/oahMBiUNCvTx2KjRX6+muuHtSv7bO1VIkUf+AmwoffWfFX5vWKMwExRs360y2/C
         waDr3JoPg6DDKLggnRyADSVBxL5vAGOaM55ZcAG0Acx16ZZAt7B6xu4R1W7EREYcDZYq
         4uQAf9xeShvZ4ahBCOEpI4T5PbTt7Ku9o3c5jjTetEWliFxBZ7wUX/lfJfc/C7ZUB2y/
         gWRaPmfSQdCbjtY9NfWGplKoCrJrLngoaksYzEY9kYqFq0sKhrqA62PxCuxmsd8D5Lys
         mmu6vNtCzsmMeZlxlz6FGafto+l3VLLMDQPPrZprjQ6L8xk/oMcTwCvul8uZe5XDVJEE
         S+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=xSiQLbNK/sYaG2E1AGcq44IV1a0yKBL3nMRosKDHAUc=;
        b=QztcZuFracwtv5iqKHzPzh5V+QiibvEVICL4/DZ/YvbroqBT2VCga7U6OfOp+f3Mhp
         N2PJUUfkuxHoiuiB4go0TKGcje2AvkK6ibgZSOlIsP7IqbtGg1BCRvTeja3SsX5d6yWS
         YlFFHL5pzTsPezHbQ07qNvwP/eAA2QCHgLtX3Ut3DK73JSnmarFJFEdiJi0kaawTEhJ+
         Mz2QgmryTpbTp66h/0u4Tl+ylsQ3PJkcRatq4OF4rad5G9PhIbJibUYVMQuV0gcZGji8
         hNHKSw80g0KgOUVPBhNj4QNm22DPK0Y1iyqSrZH1V+RcPdjIFfJRPz0N7F2jynhZHb9q
         VvAQ==
X-Gm-Message-State: AOAM530UVgYVf5oInyGs3Uepe2I/2Pld1jUJMtaFTDYK/OekoCqNhwPK
        jBGqnUu2xmgN2Uqufa+EtSJA2ZmkY6eJjv+bg6Clc3YQ4T0=
X-Google-Smtp-Source: ABdhPJy5swlD8WwsStK3wHtQZW2p3TtCmuYSCzHoXJhb6Kmsrne4peReqaY7TFqC0IcI/pHQpjAu53KhCd2sKVE/qaY=
X-Received: by 2002:a9d:3cc:: with SMTP id f70mr27544446otf.253.1637607179354;
 Mon, 22 Nov 2021 10:52:59 -0800 (PST)
MIME-Version: 1.0
From:   James Nugen <jnugen@gmail.com>
Date:   Mon, 22 Nov 2021 10:52:48 -0800
Message-ID: <CANqO7_ZUzfmhj9dt1bDW2YmVtr=fRyCErsuoMS+PqSgGkZsjXA@mail.gmail.com>
Subject: [libgpiod] Strange error
To:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

I'm getting a weird error when trying to access GPIOs from my machine.
The "gpioinfo" command is returning this error message:
"gpioinfo: error creating line iterator: Invalid argument"
This happens as a regular user and as root (via sudo).
"gpioget" returns a similar error.
"gpiodetect" works and finds two devices.

The machine is an Intel NUC running Ubuntu 20.04.
Here is the "uname" output:
Linux nuc 5.11.0-38-generic #42~20.04.1-Ubuntu SMP Tue Sep 28 20:41:07
UTC 2021 x86_64 x86_64 x86_64 GNU/Linux

The installed version of "libgpiod" is v1.4,1.
I tried the latest version (v1.6.3) and got the same errors.

I tried searching Google for this error and didn't find anything.

Thanks for any help,
James Nugen
