Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4097872D843
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jun 2023 05:57:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238135AbjFMD46 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 23:56:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjFMD4s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 23:56:48 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B412C191
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 20:56:46 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1b3b56dcf1bso22291745ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 20:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686628606; x=1689220606;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tUstb4R2NOia7NzgcIeGZFYpDPlFfq4YwMbMwKZUid0=;
        b=vWStrVq0drp/nZCbsJA0nEFY5sUI/ieLpyjgIVb2VigU37rT9qciUiwJffUjS+ZycB
         U2niYvabukuKmxFTyenmTVV8SVkD+mPH7ArSE3U4DeIDcK7YoCRgo6XxPG+fgKEQvMcu
         HYpS+UGEeSmi7BEZ1PYkAgWvBbnjvloYVO66X79JPfcImvIHElDTEQ2jfxZleg1zKox1
         UKC9lsAIiKx5x6Y9JeCQpb41vpGHyEl7OYfziRpcSe6SV11WGmnVIy0OW9GLcrtEB9/f
         YNjrj8lMqsee34adv0U+QwLId8m3jeDQvB6uO+PEjC7tT0tOUBtC8ICs+bPIneXfjuDj
         Pg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686628606; x=1689220606;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUstb4R2NOia7NzgcIeGZFYpDPlFfq4YwMbMwKZUid0=;
        b=C1JTHPSOwVR02k9pIfSmyYLbYXjImR7ydEb1GkukX75EDKn8PrycMXa+jMZJXd44cS
         G1g6CceNfSqpFFvT2YL2pfAJil00EmjknjqKDcsVpbx62Dqr1PlXgi5x1SUOuN80qgo6
         39es5+6CigxgpfqaQVtj3Z2LVCacmr7b0yk6FpUrDTS/k/uoBK7BG97rTyPDOCtjZVth
         qwx+heyBFeOvVJ/AnMq8OmXZ6wPZI0YjJY+37FhD5nNRt0R1WAlHeVYOSLUx1NZTue17
         DATzmkOxuL8ZQfEMuu5a5J+qXSJAvSPlrv2e7MRGKcy4wIHuk78EPAdWglP1JESfmDMx
         nfMQ==
X-Gm-Message-State: AC+VfDzWh/RELRWKf1KCtsOf1b3RUXeVcU0Jmm+rCYvQkniOyPN3O+2K
        c/vkoA98NI+TQEg9cEOs97EgfwYhUYThfCb57MM=
X-Google-Smtp-Source: ACHHUZ4XGIEEyEjhmSZ06wRafxz5xkeVwflaN1O5M9AOmgJx1bBoosr6w8R+btlgp0MmMEqI8tO7Ig==
X-Received: by 2002:a17:903:1208:b0:1b0:25d2:6f11 with SMTP id l8-20020a170903120800b001b025d26f11mr9554062plh.17.1686628606164;
        Mon, 12 Jun 2023 20:56:46 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id h11-20020a170902f54b00b001b3e6bbcb19sm587812plf.50.2023.06.12.20.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 20:56:45 -0700 (PDT)
Date:   Tue, 13 Jun 2023 09:26:43 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH libgpiod 0/3] bindings: rust: prepare for crates.io
 publish
Message-ID: <20230613035643.6mnwtu5jelp6xvt5@vireshk-i7>
References: <20230612-crates_io_publish-v1-0-70988ee9a655@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230612-crates_io_publish-v1-0-70988ee9a655@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12-06-23, 13:14, Erik Schilling wrote:
> After libgpiod-sys is published [1]. This series does a little bit of
> cleanup and prepares libgpiod for publishing.
> 
> [1] https://crates.io/crates/libgpiod-sys
> 
> To: Linux-GPIO <linux-gpio@vger.kernel.org>
> Cc: Kent Gibson <warthog618@gmail.com>
> Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> Cc: Alex Bennée <alex.bennee@linaro.org>
> 
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
