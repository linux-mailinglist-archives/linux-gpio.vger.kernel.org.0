Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA5A6EC954
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Apr 2023 11:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbjDXJqd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Apr 2023 05:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231344AbjDXJqb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Apr 2023 05:46:31 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39BC730F4
        for <linux-gpio@vger.kernel.org>; Mon, 24 Apr 2023 02:45:54 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-94a34a0b9e2so585429766b.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Apr 2023 02:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682329549; x=1684921549;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6MFXkgVpCP/1bbpvk371W/p2qFNZ62l76LxqdbpjYPw=;
        b=pexz5snrTLVLUJy9+1Rkx5LnVnA8IFqCUFnbiAaGiUem0VZX6DCBXEKWlPuZgbn2Jh
         AgeZpyprm5FqCGnZmORSIyuzmjohn50cupUPdxbAp5RqpcjFm4a5Pl8SYa6zaG1Ehp5x
         G0ynkphF5Hi1KrltzR+1/uQOEO+AqlKWuvnBvNaFhKX76GdVMyRtJxVnNXETemUOU6rY
         XBvT5qgmEMrr2QMT0JWpHQznbtvrF87rkakUNOfv624N9Wc7r6ss+hGNkV+qAd2Vgtyx
         58xJaXQJTtdWTlbx88QdRpew+LISMVQqhZiKjYGJOZDtFrRqTfuTEPc+a+PS61K7Vs38
         4cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682329549; x=1684921549;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6MFXkgVpCP/1bbpvk371W/p2qFNZ62l76LxqdbpjYPw=;
        b=V8vQvwQCXwc29uvLn3MAMT8vuL/27bOMIzqd+7LzH1Slz8QG6C9vqDyWR8SZC0DXEz
         2qZvA0II7blg/IAskaLZFyb7OkcrLqr6cYOEeMcx8z+QUd1r9BmxnNPQaXio0ZZpeBDk
         /brUX3L5dl0Mw1TrG8JvLDRIBGIsRlKzmgcaVC68QhMK5Zq5qAzrYB+wTVrxoKXnw0QP
         XVplX6nkX9beCOwuu6oaX7p0s1k/ZDH7lUItRabwzh9HY2sOG2P3GuOwtSVqhhkMEgMC
         0b4dx2w4mmX6LjrzzFT0al5xGV3T54uXlOqLLKULIVSpZmRGHTJrpFXvzbBhKHPzym9i
         gjtA==
X-Gm-Message-State: AAQBX9e1whhWMPzpS9Xx0WsvGtYpbfREGk/MEjOU8lTNIQWLbcKpA60r
        GgK2Gmj6qzvqTRi0i0XWOlRYEg==
X-Google-Smtp-Source: AKy350b7bES42d04i6D4v9CMoAzS13SI/cWDLB3UEV3BDuDus8hRcUfX0GD2TekhgGNZhKhzpwNQGw==
X-Received: by 2002:a17:906:a103:b0:8aa:a9fe:a3fc with SMTP id t3-20020a170906a10300b008aaa9fea3fcmr10033847ejy.8.1682329549394;
        Mon, 24 Apr 2023 02:45:49 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:fcdb:bf53:d053:3a52? ([2a02:810d:15c0:828:fcdb:bf53:d053:3a52])
        by smtp.gmail.com with ESMTPSA id w17-20020a17090649d100b009537ef8eb17sm5289845ejv.217.2023.04.24.02.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 02:45:48 -0700 (PDT)
Message-ID: <f863aca5-0acd-2eae-7127-819136cd78dc@linaro.org>
Date:   Mon, 24 Apr 2023 11:45:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add SDX75 pinctrl
 devicetree compatible
Content-Language: en-US
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, richardcochran@gmail.com,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <1682327030-25535-1-git-send-email-quic_rohiagar@quicinc.com>
 <1682327030-25535-2-git-send-email-quic_rohiagar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1682327030-25535-2-git-send-email-quic_rohiagar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 24/04/2023 11:03, Rohit Agarwal wrote:
> Add device tree binding Documentation details for Qualcomm SDX75
> pinctrl driver.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

