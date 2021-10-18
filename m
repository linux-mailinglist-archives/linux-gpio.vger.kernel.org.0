Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 330F0430D05
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 02:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344837AbhJRAQI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 17 Oct 2021 20:16:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344831AbhJRAQI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 17 Oct 2021 20:16:08 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF0FC061765
        for <linux-gpio@vger.kernel.org>; Sun, 17 Oct 2021 17:13:57 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id c29-20020a4ad21d000000b002b6cf3f9aceso1337543oos.13
        for <linux-gpio@vger.kernel.org>; Sun, 17 Oct 2021 17:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+YarjN59B/YpZF87egTLf9DlT73ZAFyg2a72BJpblNM=;
        b=fXGL48PjsKEeQLoF6lB1HzxnbSETa4YCBl29R1fdfuO0NiKHIPWngx/IeEJ7PMPCFi
         uNP3mzDHQH4MMHTpPxOsfZ9h5270XAK0mUi4gUmYc20Jan0GfgXMkfRiCyEJIhlqL6Hq
         vu+L/zt2CoKcv/E9fbpMzIlICzf+bgl7wb/UYZCx1mwQtmGGQVuZy8q5VshaxtCOAS4z
         8SGAvdi8T4q4Mr6BW2MVGzXCiy+LMiZMPMetBsLybMR8lCiM0x1Zsy7xy4pNOXC9Zrkw
         k+NJcPzBDWdBjksLDWnoeQSurZgclwgrgRadnpBvWBKHYX7f31r0YxUwWrc4Ef6sJSNo
         a7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+YarjN59B/YpZF87egTLf9DlT73ZAFyg2a72BJpblNM=;
        b=IYnUBwxqOzAklanb8n3CBHbKS3JB4QrX1O9mvRwd6eZoMKeU7F/UfGvvECokfmDGui
         PQ2FT7nNg1RFEkF13SckEoImbXgY5UY1g7Fku9YiW4JJ3H1+7AmMid8B/tUZiRQ26KT/
         TD/fLiCqLYi70strySggOPbj4n3Yd69ZhSOIawGerLD25U+V7htjvt9235qXjVGzLETq
         ViTzp651yi4+EdabJCuXfI+Zrt9CeVrHu82bFvMtxVzh8xiAMnm3AqfkA8T6M392SV4s
         2p9ZRNXSy1clhdJQiKbsu1ldRpoQFgvoAnyH1pP8C5rJZl8v131VwjXVtv4cZHI74BJp
         q40A==
X-Gm-Message-State: AOAM533lTVyrISG6u1YZkW6VuALlgA2pX6b1jFfdcyIWfzf7fDsXuZto
        feto6Ut2pKoTZbDqGDWYIXfyPQ==
X-Google-Smtp-Source: ABdhPJzFZrviIzpT32yXdWeEb9wzc9D5kwrjqNu06JxApomyzkqkQOLcKrPhO1gzJomhCyQdETWkew==
X-Received: by 2002:a4a:e1fd:: with SMTP id u29mr18974214ood.0.1634516037143;
        Sun, 17 Oct 2021 17:13:57 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id l10sm2670189otj.9.2021.10.17.17.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 17:13:56 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: (subset) 
Date:   Sun, 17 Oct 2021 19:13:55 -0500
Message-Id: <163451593812.443375.5973446055625018432.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 8 Oct 2021 04:24:59 +0300, Dmitry Baryshkov wrote:
> In 2019 (in kernel 5.4) spmi-gpio and ssbi-gpio drivers were converted
> to hierarchical IRQ helpers, however MPP drivers were not converted at
> that moment. Complete this by converting MPP drivers.
> 
> Changes since v2:
>  - Add patches fixing/updating mpps nodes in the existing device trees
> 
> [...]

Applied, thanks!

[03/25] ARM: dts: qcom-apq8064: add gpio-ranges to mpps nodes
        commit: 9be51f0b16ef83208fbfdc42fe59a622b6beee4c
[04/25] ARM: dts: qcom-msm8660: add gpio-ranges to mpps nodes
        commit: cd1049b631d05ad25b7976cf67144277598e72f2
[05/25] ARM: dts: qcom-pm8841: add gpio-ranges to mpps nodes
        commit: 6a91e584a3a0a247f836f063cbd3d99b1babaf4c
[06/25] ARM: dts: qcom-pm8941: add gpio-ranges to mpps nodes
        commit: 72af8d006b68cb88ae618d812b1053e59b06fe56
[07/25] ARM: dts: qcom-pma8084: add gpio-ranges to mpps nodes
        commit: 50ec4abed12cd0d5d34656330bb82192d607b3b7
[08/25] ARM: dts: qcom-mdm9615: add gpio-ranges to mpps node, fix its name
        commit: 7cf05e3b457b4d0eea385ad0acec327ee0adc5a1
[09/25] ARM: dts: qcom-apq8060-dragonboard: fix mpps state names
        commit: 636396efe303345cba6b0084b3228cf861d22e36
[18/25] ARM: dts: qcom-apq8064: add interrupt controller properties
        commit: 216f41938d669e7949964c181350cb61b4fdda03
[19/25] ARM: dts: qcom-mdm9615: add interrupt controller properties
        commit: f574aa0b12403dd0f4bef366199bfba860188086
[20/25] ARM: dts: qcom-msm8660: add interrupt controller properties
        commit: 789a247a3f10985ddae58a975e2550a35388ca52
[21/25] ARM: dts: qcom-pm8841: add interrupt controller properties
        commit: 3dca61a70c0453ea02089059d9d435a7b9b104ce
[22/25] ARM: dts: qcom-pm8941: add interrupt controller properties
        commit: 9fb04774f3436f93075b80870fd94e2e68f8bf04
[23/25] ARM: dts: qcom-pma8084: add interrupt controller properties
        commit: a7fe01561e6cda173b1fffb1c8552040933e7588

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
