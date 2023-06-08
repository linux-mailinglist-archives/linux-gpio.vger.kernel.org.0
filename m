Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50CC97281B7
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jun 2023 15:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235115AbjFHNtg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Jun 2023 09:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236547AbjFHNte (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jun 2023 09:49:34 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6344F2D4F
        for <linux-gpio@vger.kernel.org>; Thu,  8 Jun 2023 06:49:32 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-bad102ce9eeso730998276.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jun 2023 06:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686232171; x=1688824171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P56s/voLHkz9fUG5m5v1nOf0525Duw0HPDuYpPu2ReM=;
        b=XQhaWUg4NNNWhrtz7+MZHk2QdA7s/roFGIVPLnK0vYjqjh0bnUgEo2bj1XZIgUQ1iA
         /e+9m0k+DrUY8JkV1xE1yv4VkTJYISmVh4fZEQUYMGXd3uDm3A0F2QNa12MUwEd2jlDg
         7WIFGFhYWGhdcV59xU9cyzkjmzNzS9RWhx1KkPeb6FaGt1XQFB+UknIhvmO98iBUvr0s
         yptENh3XywYJfFYIgq5hLBEsnATCPLUOtme1aZr7fEeSod0VgIU73cDzB9mSz1SD/XF8
         v+te5N51IxfMSiEgb2Q9gwdSNOvayRUwrObVswhRUzurqlWZWFz5HFS+8ktmGPhvg8w0
         JxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686232171; x=1688824171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P56s/voLHkz9fUG5m5v1nOf0525Duw0HPDuYpPu2ReM=;
        b=iKnnmNBhiQbuP3DIQLU3l3uRgopTWB6lAgtGZy06LVtNtFP+7Kt/XBr+zF3gONY/w5
         u/ES3Ezn0aQVGB7wf+c6YtTs4hu38r+bOmUIF0CyPAlpZqarkrOuq+QWIhRDgguiYKuw
         upgZahPYFRK5IS2tZz8Y+P5JaLfgULtFf/SJ0Cp4B7HyBkE+087hTKpu7ha0fn/oNAcv
         L46YZxuTHkGy++5xxzG/apP5iXaVl8zI622RIRTqSLNrRCDb0lt0Ij4h/+nNFp4yeGw3
         pKGrR506f8pPuNSu4clQE9eA9Hj/RvLX1akefB/TwB+1t463Zr40B10fFaSjbxQqPHdk
         4OVQ==
X-Gm-Message-State: AC+VfDzg0uB5HAeRuaGyyN5zLFlHIbqa2EhE03g1K8gzpcfDT/x80F2B
        /evJgkNPxqhEUwpmc+OvTK9+vuaRAPxoCHauj6dD2Q==
X-Google-Smtp-Source: ACHHUZ5eXsDecBMtO7ySuimFpWWeTqFYH2re76w5Dnn1LSeeXWU9A3vaOUQvV936Dz7XNFemSfa1s4dg08eO7ndqpLw=
X-Received: by 2002:a0d:df49:0:b0:55a:ad0a:76c with SMTP id
 i70-20020a0ddf49000000b0055aad0a076cmr10808163ywe.18.1686232171381; Thu, 08
 Jun 2023 06:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230602132859.16442-1-alexandre.torgue@foss.st.com> <20230602132859.16442-2-alexandre.torgue@foss.st.com>
In-Reply-To: <20230602132859.16442-2-alexandre.torgue@foss.st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Jun 2023 15:49:18 +0200
Message-ID: <CACRpkdZEEq_hL5OxVu16SZL4tKgFjXNZpFLuUxmeo96rrPMsYQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: pinctrl: stm32: support for
 stm32mp257 and additional packages
To:     Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 2, 2023 at 3:29=E2=80=AFPM Alexandre Torgue
<alexandre.torgue@foss.st.com> wrote:

> Add support for st,stm32mp257-pinctrl and st,stm32mp257-z-pinctrl.
> Add packages AI, AK and AL (values : 0x100, 0x400 and 0x800)
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
