Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76BC65EDDE2
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Sep 2022 15:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234202AbiI1NkG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Sep 2022 09:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234209AbiI1Nja (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Sep 2022 09:39:30 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD19A4B3C
        for <linux-gpio@vger.kernel.org>; Wed, 28 Sep 2022 06:39:29 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id s14so19949059wro.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Sep 2022 06:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=dZzbcDvasHVCmgCTUswmTgELLKS4YHXSZQxgcCDNWa4=;
        b=v0cOztJlFkK+YVgpYtMHr2XIpkXxxt8HtM6gskaCSlsmtyUqOeFc4HBXxFbGJgzOjx
         BC0bvhiHG2wzg/t1Jf7cFSeqgn9m22WDQRpEGYmAFfapIIH6p/TBz4EZc/QqVn0eEkW2
         aeFyH+Yg33LTNWeLNuiOqjOW+swKb3ke/RJD1FaosiEmsV7T9E9exqV/6J5n11EPM3zh
         /jSeMiPdSmjiD2pscq00EvRvlDA9r9imf0t9LQ7jeUyJH83FNOBuZ4NdQV0v9Joj3mQQ
         8zy2btlzdKHqzt2XnVnJpLk90/ilvo6evq5wmmoa+dUD6ViAT0laKshUrvVFPmaTaOLF
         SpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=dZzbcDvasHVCmgCTUswmTgELLKS4YHXSZQxgcCDNWa4=;
        b=tt2u0i11rgZCvEXjYC/ALWmunqNYvU0d/OUTFM/FnN5nv3jGkP5batdCVgMsYGL6AE
         YSh7uLZHbeGroSsVnaCvmdz81mPDXKXP+zSH9Qpq4e/uMcDj3PwLj2hUQrGIyzii8RZk
         mQm7oZl2n6pwWzMYwJ3iRTJ9Pw3InQ/uB9ZPdG5tGEL8qUo7wuaVCRdNTByCjDHDqIRY
         gXI0VNNrLUFrfKDHKW0mvlhlHosOHFQ+tVFsREq2Fi9/Duu/cKC69DDN/e45kPEQrT+f
         uEfPBCdFraxSObrTjD/4tf7kRJrhJuyR6TycjkGq66tyTW+DuOfa+oR3z2bJbSd/uCc6
         aNsA==
X-Gm-Message-State: ACrzQf21eL9wDLbfIuRC/RuAAxsIIV3pDcfYYp7Q9wejPW69Fztk5x+V
        8FhdL1ARYvghFyFewmzESvDpq17xtc2IBmmXYS09w9aFi2Y=
X-Google-Smtp-Source: AMsMyM4RLPUe9eh7/28MC51czBlpUaj6k5ITGHfM1WjjxYAuqWfeylzBQzkaIfNFkhEHbrH49vbaZBcTk0HzSWhhEQM=
X-Received: by 2002:a05:6000:15ce:b0:226:f2ab:516d with SMTP id
 y14-20020a05600015ce00b00226f2ab516dmr20880407wry.264.1664372367703; Wed, 28
 Sep 2022 06:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220728031230.16317-1-warthog618@gmail.com>
In-Reply-To: <20220728031230.16317-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 28 Sep 2022 15:39:16 +0200
Message-ID: <CAMRc=MeTztswC2roZ0izWg2cQLM8Wi_ftrinYEv7GveoeYNfhw@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH] core: more explicit pointer contracts
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 28, 2022 at 5:12 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> More explicitly define the contracts on returned pointers,
> specifying both their validity and lifetimes.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---

Rebased on top of current v2 branch and added the same comment for the
new settings struct.

Bart
