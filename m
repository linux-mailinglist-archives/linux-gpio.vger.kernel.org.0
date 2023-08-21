Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5EE782A13
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Aug 2023 15:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235256AbjHUNMc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Aug 2023 09:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232017AbjHUNMb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Aug 2023 09:12:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50366E1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Aug 2023 06:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692623502;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8jlzIYKgKmR2UBRoCBcFv7SS0ZLgGsr3htxCffkKfOg=;
        b=ev8pSrPaTv2QnhIV/i4HmSlh62cVgwhI1yeRsPBSDn8PG3sSz75BwebuTOvn0/Bcgimc02
        ZCeIqGguMgjDd0ePP7WhDTsFgqlv3Ai6XCiqblNvc3x3IDyFRnduIvTmNAVUIl1kAjSdjn
        OBMOL414xylCKM0VPiphUqAwpt0+vKk=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-W8_62G0JMVOx4iKG4sN07w-1; Mon, 21 Aug 2023 09:11:41 -0400
X-MC-Unique: W8_62G0JMVOx4iKG4sN07w-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-58fbc0e0c6dso27130157b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Aug 2023 06:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692623500; x=1693228300;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jlzIYKgKmR2UBRoCBcFv7SS0ZLgGsr3htxCffkKfOg=;
        b=W+/6Zt83ElmBLohaIHTxx8CCZUapkVLHsWnR1FRq3ICpdGbkRsa7WH9meaf8cO+N4W
         saKZTYCjx4XA3NwWYCPl3JDpVlrwSvlWLJTDGVYnlSOaxETgvhCg8Zu6FmkJh7gl1Xoi
         ny5UE86hAGmiexWrCFBKK5+UyWI/eYKJalv8r+nJuuYVclJz6mG0EE5gWwivPJWI/avS
         qGMNzHMS1OGy9cGYYG6RmQur27upzGvDPW3oCwp7oDBvvllKQCgmgehB3LMN0U/RyXCX
         gUV8W1yo+whgrxjYCOi7zx94zeF8RgDpRsAXkfgb3SsZWoimckfsyhxf1oNHD29sJmax
         pwgw==
X-Gm-Message-State: AOJu0YyJAD3MWnC/8qSqEycULRcwvSEJnRL78o0t2sEup0+WegYCjR3j
        bsb0JZIX6UVh3b0LpgCeh2UuwJLDB6P7EJQfeLMyRmg7/8DL/dXHmbGclozWCbqt0gAGxn6Wx/S
        /u7rLZjsxw7KcYjDjGPyeug==
X-Received: by 2002:a0d:dfd1:0:b0:57a:897e:abce with SMTP id i200-20020a0ddfd1000000b0057a897eabcemr9208173ywe.7.1692623500703;
        Mon, 21 Aug 2023 06:11:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYvkFaI4yVV4NClUb0bxAuCbQrwyZPApNnu6TfahyfIVJgPfoUnef2NcETLjYTx5bvN/PN+A==
X-Received: by 2002:a0d:dfd1:0:b0:57a:897e:abce with SMTP id i200-20020a0ddfd1000000b0057a897eabcemr9208148ywe.7.1692623500477;
        Mon, 21 Aug 2023 06:11:40 -0700 (PDT)
Received: from brian-x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id z1-20020a818901000000b005869d9535dcsm2231861ywf.55.2023.08.21.06.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 06:11:39 -0700 (PDT)
Date:   Mon, 21 Aug 2023 09:11:37 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>, andersson@kernel.org,
        linus.walleij@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom-pmic-gpio: silence -EPROBE_DEFER message
 on probe
Message-ID: <ZONiidFpXf7MR6y9@brian-x1>
References: <20230817145941.1091418-1-bmasney@redhat.com>
 <a3431eaf-053a-4e1c-b082-e87a3aaefbf3@linaro.org>
 <ZN5KIlI+RDu92jsi@brian-x1>
 <09df85cd-27c7-d64c-9792-41110bf32fce@kernel.org>
 <1dd0bad4-fbb4-3861-9bc0-7a5f3067aeaf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1dd0bad4-fbb4-3861-9bc0-7a5f3067aeaf@kernel.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 18, 2023 at 03:59:18PM +0200, Krzysztof Kozlowski wrote:
> On 18/08/2023 15:51, Krzysztof Kozlowski wrote:
> >>     qcom-spmi-gpio c440000.spmi:pmic@2:gpio@8800: no hogs found
> >>     qcom-spmi-gpio c440000.spmi:pmic@2:gpio@8800: error -EPROBE_DEFER: can't add gpio chip
> >>     qcom-spmi-gpio c440000.spmi:pmic@2:gpio@8800: Driver qcom-spmi-gpio requests probe deferral
> >>     platform c440000.spmi:pmic@2:gpio@8800: Added to deferred list
> >>
> >> The second time it probes the device is successfully added.
> > 
> > There is a bug in DTS. I'll send a patch.
> 
> https://lore.kernel.org/linux-arm-msm/20230818135538.47481-1-krzysztof.kozlowski@linaro.org/T/#u

Thanks for sending that. I didn't look at the DTS. Let's just drop the
patch that I posted here since that message may help someone in the
future identify this same type of issue for another platform.

Brian

