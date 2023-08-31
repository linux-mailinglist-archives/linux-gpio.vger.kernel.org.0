Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B941478EBF4
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Aug 2023 13:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343634AbjHaL2I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 31 Aug 2023 07:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237953AbjHaL2H (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Aug 2023 07:28:07 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54FC6CFA
        for <linux-gpio@vger.kernel.org>; Thu, 31 Aug 2023 04:28:04 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-523100882f2so856876a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 31 Aug 2023 04:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1693481283; x=1694086083; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yvHyjPG7qUuINUCRplJZoEcbwB6qImIpL5RY/TwBK8=;
        b=gJPowC5T5XnE2dRfmE1HYdTrXIJUiGjy10McutUK/lhG2Hl2hrLyYC2sp5NqioJr4v
         aF5VY/zgu882zOxp2UY6NEGyBiVPXUXRa3rP+ZWNtKWn+e+b+hFtOgzziUNE4AG5wOTx
         Qvw9OP58Y5qNHW39HdGvLzNBtzDrKh9xWVUtiv1tsKe45f8yIqrFPns17Cer45bskcwo
         4xcWiy7Z6lz8OfaGc+inoTw34CxFSYyweK2WUKp1lI0qy8GPpbCiG4xFEsyuU5eAOn2C
         LKJDMxe4ZdLjwoTvAQLXPDz6fgOLR+DLe4eJ4zjPc9+2VyexjSJuSHwj4qQgPdt3XNPe
         dfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693481283; x=1694086083;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9yvHyjPG7qUuINUCRplJZoEcbwB6qImIpL5RY/TwBK8=;
        b=RJVaAneCUaGCw3FtEI8mjR9KAgi0HjTpFRzAwvKe7W5+45CS6fKK4fEoDStGDRmUhm
         gbvsGZ2+wlM/x1vdY+jmDdDDeozQJ9HxrN+4aBggS382wszQmioDXwiATg6ousSsG+Yw
         F8VP54eTebcj8IWHNE0RHfERnixPRxDjCvEfHb7XNEwamel14oNyliPGJXg1Elx0i1cl
         fzv3dVA/tBG4AlWrtyOuf3cLQfN+5ozAeNzKW8seq1+5MzLSHb0VW70A/EBRp686+6Be
         Ets1rQ0CDokR1kgLjxnF1IYKJ9mY0X6KylKEUk7ZqMSFFf9Ip9VlG6QmviqK1XYlNaif
         jUFw==
X-Gm-Message-State: AOJu0YzNdefkYyNKRtO223FQ/6jNVJKNRqTw7mdZrvnuu5oPYG9GA8cm
        0E+gU/ewh7XxZ7MZOmw5kYI2dw==
X-Google-Smtp-Source: AGHT+IG/hpDsEDtftxv8WRfScAb1QpBlf4Zc8+8cS6j6PB4BK2HHNwPv823nbljA1+JmHjuosy8iUw==
X-Received: by 2002:a17:906:3195:b0:9a5:c49e:7145 with SMTP id 21-20020a170906319500b009a5c49e7145mr3734010ejy.69.1693481282782;
        Thu, 31 Aug 2023 04:28:02 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id r10-20020a170906c28a00b0099297782aa9sm655606ejz.49.2023.08.31.04.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 04:28:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 31 Aug 2023 13:28:01 +0200
Message-Id: <CV6P0GSF8HWI.1I9L17HVQA7CJ@otso>
Cc:     <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-pm@vger.kernel.org>
Subject: Re: [PATCH 03/11] arm64: dts: qcom: sc7280: Move qfprom clock to
 chrome-common
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        <cros-qcom-dts-watchers@chromium.org>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        "Srinivas Kandagatla" <srinivas.kandagatla@linaro.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Viresh Kumar" <viresh.kumar@linaro.org>
X-Mailer: aerc 0.15.2
References: <20230830-fp5-initial-v1-0-5a954519bbad@fairphone.com>
 <20230830-fp5-initial-v1-3-5a954519bbad@fairphone.com>
 <0ab29903-9861-4736-b827-5dd45b504baa@linaro.org>
In-Reply-To: <0ab29903-9861-4736-b827-5dd45b504baa@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed Aug 30, 2023 at 12:09 PM CEST, Konrad Dybcio wrote:
> On 30.08.2023 11:58, Luca Weiss wrote:
> > On non-ChromeOS boards the clock cannot be touched, so move it in the
> > chrome-common dtsi which is the only place where it's needed.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> If that clock is not registered (e.g. it's in protected-clocks =3D <>,
> would the _optional handler not handle it just fine?

Right, that appears to work!

~ # ls -d /sys/bus/platform/drivers/qcom,qfprom/*.efuse
/sys/bus/platform/drivers/qcom,qfprom/784000.efuse
~ # cat /sys/firmware/devicetree/base/soc@0/efuse@784000/clock-names; echo
core
~ # hexdump -C /sys/firmware/devicetree/base/soc@0/efuse@784000/clocks
00000000  00 00 00 03 00 00 00 b8                           |........|
00000008

Never tested this case before, but since it appears to work with the
patched qfprom driver (other patch in this series) I think we can drop
this patch.
Will also have to adjust some other patches in my local tree then that
do similar things ;)

Regards
Luca

>
> Konrad

