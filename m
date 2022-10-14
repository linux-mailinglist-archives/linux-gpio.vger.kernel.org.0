Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5DCC5FF41A
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Oct 2022 21:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbiJNTeL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Oct 2022 15:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbiJNTeK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Oct 2022 15:34:10 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF19A16C204
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 12:34:09 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id t4so3753156wmj.5
        for <linux-gpio@vger.kernel.org>; Fri, 14 Oct 2022 12:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QfKY6wRs5DX/nBwR6bSysvUzWBr3pwHzNK/uKJ79NdM=;
        b=yjeEDa1/BJTrKFihAE/iVnfBSzA4NB+cXDIau+vtc7TnNiGa21F/9d/xANOM2Y5836
         2VEpHUi7KNscrN6Crx247kvOZx+gn1aHK6KTmjqCt54lT23lQoBITOtCYsGblaCPakym
         QBYl+EzOQj6fXKS8xGmfnlmuWP6auRUfmN/31MHNMWbGXbd/RMmmNzjyZUBQARBDCv0Z
         rnzQs27DEykEHf8Ab+7Sp5y4d7H5InDUXFuAYib0gjgIet5Hy4h7yiGNq+5uT/FLBwo3
         rrek/5H6soO13bZEPMbWWKf/FYKnw5OCjhdrvilyhCDDmFc1IonDm8OIqknJRvTORwOP
         nKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfKY6wRs5DX/nBwR6bSysvUzWBr3pwHzNK/uKJ79NdM=;
        b=kBxS1qzNIu713h/Ac8DKGS+1gEjA/3K4u03Fr26KZDsWPt/Q1bk7DeJBCKSrT84yr4
         4fZkVIifRofunOFo8UGATiQkikXPBhVExquITSwdqWKzYd4d3ZfRbS/cDfHD4iRgwHUN
         9K/5Vp5ie91t+2aNlDJDdIs2AXpsIRAyBBjdWjx/W5tyTGnLEuSV524VuTQuUaIIGqrU
         y/rB5WOosV67dX5juCaWf7djdXtsegpxFGAXL3N7hDq/s6CmeaajRspQKzH115OooAj2
         DwIUBNWX8vKRLf5XdpZnt0J7RGrabxKK2I0cSfky8js6Ubq9mM/glVyRrVdAzPsyWbZo
         cLuA==
X-Gm-Message-State: ACrzQf06zSGmup3BpzezPr/WzSIovw1olb4DLaiXGkagAg3fHtoBtmpm
        G+AKtsnAmNH/gATIDlIxg6j39g==
X-Google-Smtp-Source: AMsMyM6npKryELVjs18ibh73/XOtLrZazbqbNoEmp4mOVV7lkfgOXajay/3cCNk2FQiMTazPfSIXig==
X-Received: by 2002:a7b:c051:0:b0:3a6:36fc:8429 with SMTP id u17-20020a7bc051000000b003a636fc8429mr4680582wmc.78.1665776048115;
        Fri, 14 Oct 2022 12:34:08 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id bz13-20020a056000090d00b00228cd9f6349sm2566032wrb.106.2022.10.14.12.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 12:34:07 -0700 (PDT)
Date:   Fri, 14 Oct 2022 20:34:05 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/9] gpiolib: of: tighten selection of gpio renaming
 quirks
Message-ID: <Y0m5rRd1EqGSX5Dl@maple.lan>
References: <20221011-gpiolib-quirks-v2-0-73cb7176fd94@gmail.com>
 <20221011-gpiolib-quirks-v2-3-73cb7176fd94@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011-gpiolib-quirks-v2-3-73cb7176fd94@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 14, 2022 at 10:54:27AM -0700, Dmitry Torokhov wrote:
> Tighten selection of legacy gpio renaming quirks so that they only
> considered on more relevant configurations.
>
> Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
