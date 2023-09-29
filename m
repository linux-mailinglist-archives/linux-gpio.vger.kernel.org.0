Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 950197B30BD
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 12:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbjI2KkG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Sep 2023 06:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232630AbjI2KkF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Sep 2023 06:40:05 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A518B11F
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 03:40:02 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c5bf7871dcso113292375ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 29 Sep 2023 03:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695984002; x=1696588802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m3MCbMFH3xc7ZubhXRLWJZPGOiktFs7qG75sm+xrJU4=;
        b=ugQzDa7fC/J/SlGIKAC1PwgMXh5CJdo2zOGIxmxcdRf6cQ8sqKW2DunNYRTnM/aurE
         GGit93UswVjvOSCoBa8UpCAVNsNa7jQIx7JVDK0WxQReKwa5+5Bn4yX7uDXBwwic+WZB
         T8br7XCnqJBRfiBgFVdu+phnCOun94GNUIT6gRY1y2aN4WItX/qPMyQSCVJCd1tKxbLy
         VEHeGCVoDlHiJtkHdJgsHdcNYVIppTdXqIQbAbrgHGTUZjZe46dBxPv+WeFrev3ED8dZ
         TjyBdqJx/AxLq46+Mh083wYe8fmpX8elQjM3lwhZeSCEP8/gb6XU7NipFzYzRb+Q/kyb
         B4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695984002; x=1696588802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3MCbMFH3xc7ZubhXRLWJZPGOiktFs7qG75sm+xrJU4=;
        b=tKcLYakBxY4Evpap/CN9bNIP1zV653Lg0XoUfVKV7IIIQylyLyMgrD7qfDXjigrP4h
         U8oP8ECBZQ8qlHUcF90hqFZYbnmkPsRkRvyvikxmupIy6vK2TbSSnXTSsA+03SseP3yg
         k+VYekarQLp+umVaMROyTiYsWMqH+GvdRRULEcBXbDtWLZsm2o+iu1Xs1PEo+tzNQHrg
         68TsJtaDUURwgOcP0C0qxapM3pRq5FZXpVmaMuGttmOHZ2ypFK1cklHNzbqXWBYetmzq
         QvNGsNbiZ4D8apt195355c/Brw4Zpp4fCL5R/WhfokYz6dpvPwxH73u60oUMVG4eVwls
         OpAg==
X-Gm-Message-State: AOJu0Yy44MgVT0XEBHU0V4AUEW7BvWcDaXKLrgf5QFw6EuMeDjtFelY2
        yDzV14d1HIizRS82YbDMI/fpZg==
X-Google-Smtp-Source: AGHT+IEZ/dBjjYPNz3WajqKdji6ObbI9HVW+AZ4BUUEIPw4BP10eYGIe1b5ZwwtcrZTPEVJEuCMTmA==
X-Received: by 2002:a17:902:e992:b0:1c6:d01:86a7 with SMTP id f18-20020a170902e99200b001c60d0186a7mr3714798plb.20.1695984002110;
        Fri, 29 Sep 2023 03:40:02 -0700 (PDT)
Received: from localhost ([122.172.81.92])
        by smtp.gmail.com with ESMTPSA id s18-20020a17090330d200b001c6052152fdsm12062869plc.50.2023.09.29.03.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 03:40:01 -0700 (PDT)
Date:   Fri, 29 Sep 2023 16:09:59 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: Re: [libgpiod][PATCH 1/3] bindings: rust: fix soundness of line_info
 modeling
Message-ID: <20230929103959.ahaf6edlxkngyhir@vireshk-i7>
References: <20230927-rust-line-info-soundness-v1-0-990dce6f18ab@linaro.org>
 <20230927-rust-line-info-soundness-v1-1-990dce6f18ab@linaro.org>
 <CVUL0PI4MCEG.3H1JSHTV7KKTN@ablu-work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CVUL0PI4MCEG.3H1JSHTV7KKTN@ablu-work>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 28-09-23, 15:24, Erik Schilling wrote:
> > +/// Line info
> > +///
> > +/// This is the owned counterpart to [Info]. Due to a [Deref] implementation,
> > +/// all functions of [Info] can also be called on this type.
> > +#[derive(Debug)]
> > +pub struct InfoOwned {
> > +    info: *mut gpiod::gpiod_line_info,
> > +}
> 
> While going through all the structs in order to add missing `Send`
> implementations, it occured to me that it may be a bit confusing if
> only this one type has the `Owned` suffix, while the others are also
> "owned" but do not carry that suffix.
> 
> Not really sure how to resolve this... We could rename the non-owned
> `Info` to something like `InfoRef` and turn `InfoOwned` back into
> `Info`, but reading `&InfoRef` may be a bit weird?

I like this one and none of the others.

> Alternatively, we could rename all other structs to add the suffix...
> Then, "Owned" would maybe sound confusing - given that no un-owned
> variant exists.
> Maybe "Box" would be a more suitable suffix in that case - borrowing
> from the Box type name [1]?
> 
> Any opinions here?
> 
> [1] https://doc.rust-lang.org/std/boxed/struct.Box.html

-- 
viresh
