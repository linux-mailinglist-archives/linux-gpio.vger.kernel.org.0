Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA2907434B8
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 08:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbjF3GIt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 02:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231718AbjF3GIt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 02:08:49 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129A0213D
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2023 23:08:48 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-56344354e2cso1039626eaf.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jun 2023 23:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688105327; x=1690697327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uBHN6YSPHc/aFwUAzEHErBxz0I7GMbSDfxbHX+HPydk=;
        b=Y2OcXkCUNgPrDUABzVCBSiQHr+yg7i7IHvvKDw9pnWNQfWajtBI9jXY0qxSpmEmlB+
         a7foCHYWuM4QHs5qh7YBTlJLLM0FwHozx1gZPXp6Iq6xkmaA09vGCz3ZromuXcMU/PlD
         zir8RK7dX8nYylqHZK68HedTneuF/N9UAWnPPxTMI5G8+Wk+8FW0bU8qAd5K10tsoDzG
         7IrRb73QE21LSVuKB86BfKzdMkKPcOJq2iQD3GP/IQ5wf12DnLLPoStzhJOZxdHmBQC9
         mp78fLspJCOzaBJOq4WYF80dkofSoJkpSd0GZWfU7p3RaQDJe7jhrqPPaWo47fjmPmwF
         1PJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688105327; x=1690697327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBHN6YSPHc/aFwUAzEHErBxz0I7GMbSDfxbHX+HPydk=;
        b=BLjoWJ/vD777GB+RgkbkLoFnv7X9U+mmx4mKuwLWQ+FcizHT8Lm4hBZ6tYWl/f2V0B
         f7zRl11xTtXbuXoWGwQhYblL9P6xdSV1BZK/MGKEzmNw2S1QKlhphR7yXgaAJsNHAHK/
         51gdyAyH6lBrFoDUF34IrAsbjTDpbrZYRLwIGHpB0L/ppWMuquOc66lB6zzb/IOMInvT
         pk7afkRk8Xc+SwXb3nH4r0PIg8aP8dsD9cwguNlGQnwh3kKQ4TIteAmhlNXFw+Az2THS
         nTng5I6w+JhBnfbhWFUZvfxPUyCRAq+OPsc33b4lVYohuZN4cpO80hMSGBC4uZSaZwT2
         yx3w==
X-Gm-Message-State: AC+VfDxOA4aDvzQwiyWCgVhWYr7sK3IdLA1sXviMZZNJ+s+aV7E98bgU
        Psiwcj1NylDFYAb8CbXpOW87OQ==
X-Google-Smtp-Source: ACHHUZ6h+UtuGkIgMYbmelTopHcXg5fyicpO8/ppNwHDjZJwGs3txbfpW2moGsU86XHblIIG+YWBLw==
X-Received: by 2002:a05:6808:2a78:b0:39a:a4ab:22f2 with SMTP id fu24-20020a0568082a7800b0039aa4ab22f2mr1449369oib.56.1688105327375;
        Thu, 29 Jun 2023 23:08:47 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id z19-20020aa785d3000000b00679efed4108sm6539044pfn.33.2023.06.29.23.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 23:08:46 -0700 (PDT)
Date:   Fri, 30 Jun 2023 11:38:44 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>
Subject: Re: [PATCH libgpiod 0/4] bindings: rust: clippy: fixed warnings
Message-ID: <20230630060844.ctc2j624m2gnydkp@vireshk-i7>
References: <20230629-clippy-v1-0-9ff088713c54@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230629-clippy-v1-0-9ff088713c54@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29-06-23, 13:08, Erik Schilling wrote:
> This follows up on my promise on Kent's series [1] to look into whether
> these casts are needed or not. Most are not, a few are false-positives.
> 
> I also explored some shunit2 based test-script to automate the testing,
> but that became ugly with linking issue and needs me to revisit it
> another time. So this only sends the fixes for now.
> 
> [1] https://lore.kernel.org/r/20230612154055.56556-1-warthog618@gmail.com
> 
> To: Linux-GPIO <linux-gpio@vger.kernel.org>
> Cc: Kent Gibson <warthog618@gmail.com>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Signed-off-by: Erik Schilling <erik.schilling@linaro.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
