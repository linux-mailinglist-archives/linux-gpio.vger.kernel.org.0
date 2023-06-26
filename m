Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71BF973E567
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jun 2023 18:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjFZQl7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jun 2023 12:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbjFZQlf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jun 2023 12:41:35 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16F8E12B
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jun 2023 09:41:33 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-98df6bc0048so284401166b.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jun 2023 09:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687797691; x=1690389691;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idkWwIH+5FboGllM05VsgoMb7apbDd8MpT4mk8cjIew=;
        b=vSkqpwXyVL0dAJWcU0aIZoIj+dCFbJTumg8309O6Cl2F/oujpo4hK1/TBy22dfmnui
         RtmLnMFrsGk9Wig1ZigO3a+6/Gzl8TenRK5r9a7W+jx2yflqXWC8IhWUQAqZyTf1AlIM
         T9+5yNVCj29mAcMYNhLd+AFlTBdUlD2jcDdAUqKDwX+5ndXRQqJ0w8lUKm8CZn7nLz5v
         vYrvJuzGXCEpqozXtT71/zD3JokAsO4OHSUcxooSiOu2n5Yz2JZWlqJK0ZNtHYxx/7sU
         oWmQRzPtu25a1RrmqYyyZy8mnrfFvHXgzNouR5MqbQdGVb3u3gXaZnPHxX86pLV9P387
         Y0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687797691; x=1690389691;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=idkWwIH+5FboGllM05VsgoMb7apbDd8MpT4mk8cjIew=;
        b=TRF3vPZQbCKDLd/BHHGVNUBs9y6+a5j4FNw2FLFJ8yn47kBuHjra1GrI069RtCDtSm
         p8Ng4c04XDy082RwyMSk1fZR4k4N+gOd4mmuLdSflRxILABK1usLDQ+iAC9Eh8HTS1zj
         iakOoB8FwWwRP+O137imfr+o9czl8auHtV/KGJhceZpSEXECLUt2hbOeHIVhWfL9WTWD
         CCveZU7+91cD6fq7VpUK+DfN/1tKv3QuactlEvl9UAckBUr3K9DwhrJKsUPYULbVSRYX
         w/mR2+uYZKfG6vIcIE5umtztaeM5d3ofwL1hW8Fp7Zx9+VLM0c0cIM+N4S4mTvUiVzo9
         2lcw==
X-Gm-Message-State: AC+VfDyKyH4sL0pxc8MEkN1cHQ75qtQsAQS/X8RpFMPDzLXwLRT2UPLU
        a9U3pvIWug7nKVMsStzgoVsb/bHPErhk+lE6lQ8=
X-Google-Smtp-Source: ACHHUZ7iwaB1k6a+VDiM48NqrCU2eP+EGSoIuLHfjxXb875UeNBwiy0UdGj3BrREHsu0bgljrB7hUw==
X-Received: by 2002:a17:907:7e82:b0:98e:b48:24fc with SMTP id qb2-20020a1709077e8200b0098e0b4824fcmr5822466ejc.51.1687797691506;
        Mon, 26 Jun 2023 09:41:31 -0700 (PDT)
Received: from localhost (i5C7408B6.versanet.de. [92.116.8.182])
        by smtp.gmail.com with ESMTPSA id k25-20020a17090666d900b009737b8d47b6sm3430869ejp.203.2023.06.26.09.41.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 09:41:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 26 Jun 2023 18:41:30 +0200
Message-Id: <CTMQCJ195FCW.3NQSZGRPNM6EZ@fedora>
From:   "Erik Schilling" <erik.schilling@linaro.org>
Subject: Re: [PATCH libgpiod] gpiosim: fix data race that corrupts heap
Cc:     "Linux-GPIO" <linux-gpio@vger.kernel.org>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>
To:     "Bartosz Golaszewski" <brgl@bgdev.pl>
X-Mailer: aerc 0.14.0
References: <20230626-datarace-v1-1-b78e2abb493b@linaro.org>
 <CAMRc=Mcn9N2+nQKCW6_Yu_urHuTtEcGzdeJyRbTa9YYTFKx_gQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mcn9N2+nQKCW6_Yu_urHuTtEcGzdeJyRbTa9YYTFKx_gQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon Jun 26, 2023 at 4:36 PM CEST, Bartosz Golaszewski wrote:
> Nice catch, thanks!
> I applied it and just changed the Fixes tag to
> conform to the kernel style.

Thanks! I updated my gitconfig with the correct pretty format.

> I actually saw some issues when running rust tests some time ago but
> couldn't reproduce reliably, I suspect this was it.

Yeah, it was a bit nasty since this mixed up the double-free backtraces
really bad. I was starting at the ref counters and Rust abstractions
for quite a while and could not make sense of it. And once one added
too many debug prints the chance of reproducing it got reduced pretty
severly on my machine.

- Erik

