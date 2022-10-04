Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C81DB5F3D2F
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Oct 2022 09:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiJDHYt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Oct 2022 03:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiJDHYs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Oct 2022 03:24:48 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB756407
        for <linux-gpio@vger.kernel.org>; Tue,  4 Oct 2022 00:24:45 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id w10so4738214edd.4
        for <linux-gpio@vger.kernel.org>; Tue, 04 Oct 2022 00:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=0B+JcpdGhlThLYUC/7M08p0TFB1ZHIkuANRs/q4beEY=;
        b=uzKNudX9VGr/uxu8Up8o9MKvjRJcRzgDt8slaYGFGJSqyHba+3P+Vaf4jZdlWDJo0a
         aDvP/tSqzjHy5V7mg81D/hiUxy+DhSDuYFD6gKwAUroY95fqZxgoLCFEM49RpFiy6akn
         JtPu4k6ujHIJgABZjxqyUUq4XPHcC8X3J6qdVVLtvl46rmcpuGUM3I/7OupQGMfDBoYo
         kpHw7sJfrLseyuyXrXFXgKm5CNsbcxy5A6agq0i3EJo8HAaAmkKXltfA3s7xLlmkwGDV
         0wuG27tbbi8NtSRuQuiIN+ou8XwLtdmURkjPBfnu2fjE/fysEwoUW60qCrHBZi8/vmCV
         WxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=0B+JcpdGhlThLYUC/7M08p0TFB1ZHIkuANRs/q4beEY=;
        b=tdAMMFyV2kCFFKDASpLFAZ3L4NAIMe/a3i18Gbc9aDHloTN4hvtgwPjF6cebuZIe21
         GPh+jDZoThkX1kUlrAVRmyuKA/rpCQSBec8UoSM7aVHH5ZQGQ9lU4i4/ZhX9y7ax6GKN
         5W3DYWqD5LsRxchK8acGFrv07M9AWEgPs5y5aeqB6LS1EN0TCN/wEKGRjOb8yQedXikJ
         iQPk6JZefTZY5Z8EYYxeH+occRMqDCPgejIMnfsubJn2lOQylWkcmBmVM6mDDPkxNzUK
         c/33BlGbf408SvNgyTUZrW2/pJ3IyKhKQ2bpZT4iNMn0dbdpNC2fpi9fUTYW2SW8G/iZ
         fi0A==
X-Gm-Message-State: ACrzQf1jBakVwQX/T9QYJYg3hyIvG/bfa8WyDJ0lJXfaftu0BK3Pd2Pm
        pDv3UewkSGWYbGJCdxdEfJFeK3Qebjil6eY9xlpu+Q==
X-Google-Smtp-Source: AMsMyM7sbp1gL5sE2vKQL5hucVrKzwEHJx5AzBwZfAt49KmnXECJPHzXZWaHxQermCxioUoZ7LQMqyKuOHU6y1jmA6g=
X-Received: by 2002:aa7:cd4f:0:b0:458:6077:c3ac with SMTP id
 v15-20020aa7cd4f000000b004586077c3acmr18767224edw.32.1664868284189; Tue, 04
 Oct 2022 00:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220923101038.18036-1-shangxiaojing@huawei.com>
In-Reply-To: <20220923101038.18036-1-shangxiaojing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Oct 2022 09:24:33 +0200
Message-ID: <CACRpkdbsF0uKoXT2dG5rqZQqDPh01XNXtFg=6ftDOADf=hJFWg@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: bcm: ns: Remove redundant dev_err call
To:     Shang XiaoJing <shangxiaojing@huawei.com>
Cc:     rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 23, 2022 at 11:37 AM Shang XiaoJing
<shangxiaojing@huawei.com> wrote:

> devm_ioremap_resource() prints error message in itself. Remove the
> dev_err call to avoid redundant error message.
>
> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>

Patch applied.

Yours,
Linus Walleij
