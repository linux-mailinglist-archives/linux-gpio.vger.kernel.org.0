Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 795A577A1E5
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Aug 2023 20:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjHLSmk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Aug 2023 14:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjHLSmk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Aug 2023 14:42:40 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29038E7E
        for <linux-gpio@vger.kernel.org>; Sat, 12 Aug 2023 11:42:43 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-447b64b0555so856895137.3
        for <linux-gpio@vger.kernel.org>; Sat, 12 Aug 2023 11:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691865762; x=1692470562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BG6TEj+Vmqct4p/xVvKtxR2VE7OQUCPI27l+1iu7xaY=;
        b=tl7pwggIrno5jRKzlx4JfS45KYZdkPUzCYQycaizSHnGYTAjk+JMEcihEbpuBLYAxN
         MumCB4v6BzFq2nsWluUel3lo9JmWhYecn7rHZMSf7Yuwatf+kVRuirBUESsrnzVEMNrM
         kZ5Dzs40jq7GeHCRX0Yq+TaL3x/YAs1Gu4CQBHXif18cui9bgPmGmwkt/S6pbgTt5MSW
         MK0fciyD4TXbvE8WGhscIRxdNE6aslzhLfz4dBBvQ6IU9/j5WaI00Sz4kTuNWtRyyVgi
         H5Jd9IQ84PotJLNFYrk9bzAfitlHOIsT51iCE96vXzo5C5yUaGsgTT5KK1FXlAV1qgbM
         5ZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691865762; x=1692470562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BG6TEj+Vmqct4p/xVvKtxR2VE7OQUCPI27l+1iu7xaY=;
        b=Up4bLj537RG6Jyeo9fFTK+EmYWOcHro6CtZNeVNwosTapA+oYP31RDFTdp373V6q8V
         9cjva+XOLxGXln0B7lPaM5FnchzAK7KUDSSYDiAANj51mPm2bhtJ2obYH4UCKDyqyuIi
         ZEE9qDY9OiPK2yeCBuduQAAMtlnPTfdm3RWcEu5CyoS68h+zk/uVFvpjelij93/BWT2r
         jWL+W//Va8QBstEMBRucpMok4ZlkJbWXKmpr6xGTr4QQpT4DMNtu4bOhqlxQgS8e20aY
         orZMQZG0zGfd/ntg6MutQiw89l/4UVuZn0atYgpeODAEmRW3nvJ0p9y/C6l8NK0X4I2x
         59eg==
X-Gm-Message-State: AOJu0YzByFS4OedyiYA8+xBJWKATbjWMg3WtOorNv0S6maPInU64Zeq7
        IReza9vLOjtMSJ/MNkwUkBHlPUtn74fGYtfVxjQLT6CSNtoovGSIGRE=
X-Google-Smtp-Source: AGHT+IF2gBVOldpAe+goIMD3C0F26H+pOvantKCYTIhDES7aJNbCCjQ1uwGRHr+6bf00USYHVjRZEF6ob0H+LdaBfY0=
X-Received: by 2002:a05:6102:1d3:b0:445:228e:62db with SMTP id
 s19-20020a05610201d300b00445228e62dbmr2608383vsq.8.1691865762232; Sat, 12 Aug
 2023 11:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <a6ce12acff7b4ed9bae1df0115bba1f3@schrack-seconet.com>
In-Reply-To: <a6ce12acff7b4ed9bae1df0115bba1f3@schrack-seconet.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 12 Aug 2023 20:42:31 +0200
Message-ID: <CAMRc=Mcc7M3wbGX+77pUkQFTiPtDx3vYkWp=8eJWMh6k4eqhhw@mail.gmail.com>
Subject: Re: [libgpiod]: feature request: API functions, const correctness
To:     "Hollerer Franz, Schrack Seconet AG, Entwicklung" 
        <f.hollerer@schrack-seconet.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "Ullrich Lucas, Schrack Seconet AG, Entwicklung" 
        <l.ullrich@schrack-seconet.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 2, 2023 at 4:06=E2=80=AFPM Hollerer Franz, Schrack Seconet AG,
Entwicklung <f.hollerer@schrack-seconet.com> wrote:
>
> Dear libgpiod-team,
>
> I have a request, and it would be great if you could consider it for futu=
re versions of libgpiod. Within the current API it is not obvious which fun=
ction parameters are input-only parameters, and which parameter are output =
parameters, i.e., will be modified.
>
> I think it would be helpful if the API is const correct. As example, I th=
ink
>
> > struct gpiod_line_info *gpiod_chip_get_line_info(struct gpiod_chip *chi=
p,
> >                                                unsigned int offset);
>
> should be changed to
>
> > struct gpiod_line_info *gpiod_chip_get_line_info(const struct gpiod_chi=
p *chip,
> >                                                unsigned int offset);
>
> making it clear that the chip object is an input parameter which is not c=
hanged by the API function. Same argument applies for many other API functi=
ons...
>
> Thanks for consideration & Best regards,
>
> Franz Hollerer
>

Hi Franz!

No, this is not something I'm considering. The objects in the library
are all opaque. What the library does with them internally is none of
the user's business. It may want to modify the structs for some
internal tracking for all you know.

Doxygen docs in the headers are pretty clear on what argument is used
for what IMO.

Bartosz
