Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3D667A037
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jan 2023 18:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234410AbjAXRby (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Jan 2023 12:31:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234770AbjAXRbp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 24 Jan 2023 12:31:45 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF9114ED0D
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2023 09:31:41 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-4a2f8ad29d5so228413267b3.8
        for <linux-gpio@vger.kernel.org>; Tue, 24 Jan 2023 09:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QAWZNKWNBnz2nm7fG3oJ2Ondshli1quuAhafNezlm2I=;
        b=vmOWgr9rkUwzXlseFVsT2j864QAGrD36dNV6+hb9Z7hRLYJ8B5WeRZdEpjer9y7ZXe
         y3QrwhGV4pSrb3uagpnMn9m7/R87CzSOQh1IMiI/Ze8ueXecFpmJdcSaN8I9jtsmCAcN
         xFYH9X4OMx83uCjY9yqRshrNksPwFYRMa4Rny8507wYI6TRGrzwtgTMuGK5om09FRo3V
         6GUQgPGuq8fDJDIGNIxBaQExAtH7HCjVd4U5z+9I7stqOeHP6HY3Rrp7zHrkLvvLyufq
         4YKtIX9+fDcRiCAKfOkz6LlWFxlJr9Mq0SgSh5ihV8KN0m2O18EeAPFxR8riEi+Popz0
         7gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAWZNKWNBnz2nm7fG3oJ2Ondshli1quuAhafNezlm2I=;
        b=rfgC4hJY2EL2++IqGfZmkldTTNXFcmoCvkR8T+Xf9WfF1N+sFQbEgrS+QBLg/YqPBH
         xDleOtY0vsZHDN5ejb5fICZhzun39wKG1/2PXVyiU4wPnjTf7JVYCbyqtihSaz8YPCZ2
         xjxq+UjY1QU+TqlePr3Mwf9VQbVRr50SbR8JGVP+1Zu/GqykB28lSRV0u9/kHL7zvctS
         2UQnIMWZcePB0XYGN8Ty8fFBoAT4Kv/KjZxjtaU72X/EZfdjEe9h+fq4bsMv2ZjlJXF3
         TaJbxNlji+y5nR/8ZAib1Xv2b7dOVfgdUVjXBKag5I18rbIrTv9b158GhQpUgmvxfB/p
         GRtA==
X-Gm-Message-State: AFqh2koLWPYLTaiW7cZl4OdCq0t3QgAyHkXcFBAK6aVk57HiRgbDA6lK
        fZ0HLd2yKP9ungCHAXIQqXoiL6rUXIun96i/FeoGAA==
X-Google-Smtp-Source: AMrXdXsZAyRHAzMydmJt0v6Zl159VWuKM4IasufLzc1VlCjkIdzuHw0AHwiN22tOlj83E3v3X9dDNJNrvuw/U/DjuBY=
X-Received: by 2002:a81:6d8d:0:b0:490:89c3:21b0 with SMTP id
 i135-20020a816d8d000000b0049089c321b0mr3916907ywc.132.1674581500991; Tue, 24
 Jan 2023 09:31:40 -0800 (PST)
MIME-Version: 1.0
References: <20230124141541.8290-1-quic_devipriy@quicinc.com> <20230124141541.8290-8-quic_devipriy@quicinc.com>
In-Reply-To: <20230124141541.8290-8-quic_devipriy@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 24 Jan 2023 19:11:00 +0200
Message-ID: <CAA8EJpoHqpo=QWHwO=LEbT-Mk4gr7F1X4ecL0Y+kbG8Ow6cGiQ@mail.gmail.com>
Subject: Re: [PATCH V1 7/8] arm64: dts: qcom: Add ipq9574 SoC and AL02 board support
To:     devi priya <quic_devipriy@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, ulf.hansson@linaro.org,
        linus.walleij@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, shawnguo@kernel.org, arnd@arndb.de,
        marcel.ziswiler@toradex.com, nfraprado@collabora.com,
        broonie@kernel.org, tdas@codeaurora.org, bhupesh.sharma@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_srichara@quicinc.com,
        quic_gokulsri@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_arajkuma@quicinc.com,
        quic_anusha@quicinc.com, quic_poovendh@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 24 Jan 2023 at 16:17, devi priya <quic_devipriy@quicinc.com> wrote:
>
> From: Poovendhan Selvaraj <quic_poovendh@quicinc.com>
>
> Add initial device tree support for Qualcomm IPQ9574 SoC
> and AL02 board
>
> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> Co-developed-by: devi priya <quic_devipriy@quicinc.com>
> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
> Signed-off-by: Poovendhan Selvaraj <quic_poovendh@quicinc.com>


I suspect that the order of sign-offs is incorrect here. Your sign-off
should be the last one, as you are the person sending the patch.


-- 
With best wishes
Dmitry
