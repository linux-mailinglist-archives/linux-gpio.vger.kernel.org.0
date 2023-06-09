Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA7B728FEA
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jun 2023 08:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237478AbjFIGZF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Jun 2023 02:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238021AbjFIGZB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jun 2023 02:25:01 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9BD1BD6
        for <linux-gpio@vger.kernel.org>; Thu,  8 Jun 2023 23:25:00 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-39c68a3c5b9so379873b6e.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jun 2023 23:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686291899; x=1688883899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j1bh7+lFJObGYUmxUtSUyIjCbrItmDMGIYdtrVcoRpE=;
        b=Lj1gnxmjYiV0YErbz/6xJR4rWkOUrpvhZHQ9W+gZ5MWgkoNCgWILa2McteeraWpO7X
         z7Kz+w6gq2V9tPs1OKuPSNsktckXBp1YzxNZaSefAuG5PhB3873O9uNn1bC+jyDOWHpt
         8vwqciXSKphf4SZy3Ado+MIfF5wJncUGbpo/gxIpZzYfhhuHq/QkmW4XG9NnZq3gpFK2
         TBuMKV+8cQ7N9pRDT3cBZxZW+sejUi9ZTwZR9hXlgVUPARnuQr8cVe6lkBy2TDbBf3nq
         DBNKqLKNzJZY4JZzswQm2MfNU4+uJZ1XQa3Gi8PaqPpUEcxxUNa716XymUFv2hz9DXIm
         DVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686291899; x=1688883899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1bh7+lFJObGYUmxUtSUyIjCbrItmDMGIYdtrVcoRpE=;
        b=eJS61LegIggZt5bDgl/J8UmrxaMZa0hWqY1jmYODAd5SA8Q82PfS9AMcKFFrTKKxnQ
         FTRtO6D+yCKLi344J32ZSihALkbe4ieMSmbzfHcNSYNH/RvFD1W+dOK86XsB8JNMQiH+
         7/pWzyTqw9eBoruGjYqW302m9kWkW7sypBlBKTdMRmM/xsmLCvqBXzYC6LM99n84RQ+j
         U/4IuvkaeCWWnw12sdPg0Ip2h0POfnv38oz3kCvuP07fSd5Ajnneot+hXGPK5qvaJr97
         0NnfkHnZx/NXtgVE0KDSgbQT2PecCzjITPPefb65nqn79VzVLzqbzarZPATHlvsQtUwn
         dTtQ==
X-Gm-Message-State: AC+VfDxmGk5c93RA++NhxEBf+q0UW/W0bFKHRPVXOVtiUdl7aWn5QOQ7
        s+p02ldOcY85liTlw1X5dA4fBg==
X-Google-Smtp-Source: ACHHUZ6eJpme9JzqwUpUF2GfKUr5y8NP/UbMVfKgVLyzWH5WhJz7WZfDp4hnv7ijwcXIkptyHJVXbQ==
X-Received: by 2002:aca:2219:0:b0:39a:5ce7:f9e3 with SMTP id b25-20020aca2219000000b0039a5ce7f9e3mr696803oic.48.1686291899105;
        Thu, 08 Jun 2023 23:24:59 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id q34-20020a17090a1b2500b00250ad795d72sm2284114pjq.44.2023.06.08.23.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 23:24:58 -0700 (PDT)
Date:   Fri, 9 Jun 2023 11:54:56 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        erik.schilling@linaro.org
Subject: Re: [libgpiod][bug] building rust bindings requires clang headers
Message-ID: <20230609062456.fqw3mqvtcactx2zj@vireshk-i7>
References: <ZIKQVol59uXI5PyI@sol>
 <20230609061812.4haoqdyinsp47zet@vireshk-i7>
 <ZILE258m92XrBvNP@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZILE258m92XrBvNP@sol>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 09-06-23, 14:21, Kent Gibson wrote:
> I think that is what the AC_HEADER_STDBOOL already does - but that
> detects the gcc header, and the additional check needs to be for the clang
> header.
> 
> Unless you can convince clang to use the gcc headers?

Ahh, my bad :(

-- 
viresh
