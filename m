Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC3F70591E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 May 2023 22:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbjEPUuh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 May 2023 16:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbjEPUug (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 May 2023 16:50:36 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E70E45
        for <linux-gpio@vger.kernel.org>; Tue, 16 May 2023 13:50:35 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-52160f75920so10250690a12.2
        for <linux-gpio@vger.kernel.org>; Tue, 16 May 2023 13:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684270235; x=1686862235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zQwO1AW86ZZMLv1I226cO+hnWHW8xIqRy3E2TLcdclA=;
        b=fFhG9M9BqB2Jhhucg0HrxXSX2VDAxo8VMXPAmarNkjhKXtKNnIKwpdr5CJY72A6B3n
         I7Ups187ntxJFuKWvFdd4ZS3604bvLbMPjDvPhSmshRWSMvI9fNpZDE1Jzg7WhICSmZq
         IlXhZj1G/aY1nBpyMbqOO7qk3Nj2BP+W4FP7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684270235; x=1686862235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQwO1AW86ZZMLv1I226cO+hnWHW8xIqRy3E2TLcdclA=;
        b=eRGclenD+fOJ8nGy6HLFI9Ka9H7C2BKQPLPujAd15XZL32hDhXZf1iUpRzFZzCl/0T
         sxdM8NjwEQqhcf/pLe4+e+xZeAHWvh0kiCEf1DdFw41LWpXI718pjcJW7wMBpAK2V5Dk
         qKym8tQfTWJPrxoRhavTLs6CjLSXg1wFJ1BrcJDC2aijQdUgdV8F6TFtKYkDgG7qVoND
         gQM7RPjASngtxJXlethmE6h9mxeYYbNnxC77hsHf1QMY2p2H1pvLWN93gL0oBIar5IJd
         LhqLZwt7BpkvfzAcn7jZttO0i8Ec0POvsaWgPeBXVQpgXxp6CVkP2t48mlObi+FQegmA
         3sbg==
X-Gm-Message-State: AC+VfDxIAB/P5n/TG8APYpmmcZjCzXu3tsTa4RLxEbQ7wDtqRtidoIuf
        GWmFkb4BMH/s1RaftabyL0hQ1A==
X-Google-Smtp-Source: ACHHUZ7zbSTqF2+Ctw96wBfV5FayFZLDDyPrQ785jpE1+sute7vYZzIO1eBBcnyFwmB5G5I0TAFTNA==
X-Received: by 2002:a05:6a20:7d97:b0:ff:e60c:ee93 with SMTP id v23-20020a056a207d9700b000ffe60cee93mr43232036pzj.26.1684270235098;
        Tue, 16 May 2023 13:50:35 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id i13-20020aa7908d000000b0063f2e729127sm14237746pfa.144.2023.05.16.13.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 13:50:34 -0700 (PDT)
Date:   Tue, 16 May 2023 13:50:33 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        corbet@lwn.net, tony.luck@intel.com, gpiccoli@igalia.com,
        catalin.marinas@arm.com, will@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 12/18] soc: qcom: Register pstore frontend region with
 minidump
Message-ID: <202305161349.7306F11199@keescook>
References: <1683133352-10046-1-git-send-email-quic_mojha@quicinc.com>
 <1683133352-10046-13-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1683133352-10046-13-git-send-email-quic_mojha@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, May 03, 2023 at 10:32:26PM +0530, Mukesh Ojha wrote:
> Since qcom_pstore_minidump driver creates platform device
> for qualcomm devices, so it knows the physical addresses
> of the frontend region now. Let's register the regions
> with qcom_minidump driver.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> [...]
> +	strlcpy(md_region->name, name, sizeof(md_region->name));

nitpick throughout: Please use strscpy()

https://github.com/KSPP/linux/issues/89

-Kees

-- 
Kees Cook
