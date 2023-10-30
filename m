Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF7927DB7FA
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Oct 2023 11:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232533AbjJ3KYv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Oct 2023 06:24:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232617AbjJ3KYP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Oct 2023 06:24:15 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 181352D44
        for <linux-gpio@vger.kernel.org>; Mon, 30 Oct 2023 02:50:19 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c50ec238aeso59004791fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 30 Oct 2023 02:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698659417; x=1699264217; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1BIXjvXDntxem7mZ7Qq/m56h8knZQL7orEKUL9eU4jc=;
        b=e6GrC9u2n0GlUjx9CkfmjVnarEmr9GDrGU1c+nur6JsZaAKbmNblnsEO67eLCcTbMe
         vydxawSM5Ar+eBz5NJuCZaqPPkxl/DiY65un4dp4ApIR8pGFsYd7C4DK/ZpCu1VHfhkD
         yE1vWnEiPzSAjhYHJlnsB+4FxwrgDIB0+sfmagKhWMwx+pBMcXGp3CwFbeIDGVaHICq3
         zIYinLbLbbm1H9SK2TbO23CB8oJMYm3O3poL5JEadOQ8Ph6TeuF+liJZTdAKDW8Ac35/
         ELjoq10srYC1vt60HwWRli8gbGmJoq9h83BREXNMS6bd1AgKV8FzOq7UC7TnEB6YPiI9
         s0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698659417; x=1699264217;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BIXjvXDntxem7mZ7Qq/m56h8knZQL7orEKUL9eU4jc=;
        b=qgJBoFK39ECsUmrWZvXpitqoTyEm9bDsXDzkli/z6gMRM4bOIeaOZvpcbAdTaYL51x
         VF7aW45qxxI47dYft+b0KNv3RKz4Z6lRuw24TieNzszBdRvos8NThDADRhPh/G6/eXA3
         q/UMMq59UOLOOk6gteE4DEZfi3VkbSIeGYna6X44R05jgQQOrhFYIFKhKs9SiHeJlJ4W
         CCQ2PKEvEfwGXaOLc5bI7KMivaWMEJoxNVwe48mgHREN9CHdf+ZOqoIs8HegUgB5ZvSB
         7rIhilQ24wYUlyWLOAaKJLxaPbdQQ6so2P22wzGEUf54F/PEABkIVVa/IcKc4+UEbc4v
         FE6w==
X-Gm-Message-State: AOJu0YxCHbd7nVt+JAxOz2I5HUtBL3y/1cIG0GakTjVVQHRNpa1p+A9G
        jIRa4o0E/L0dE9OV0UfTdv7rNPxx7pLoPD1dEpNtcg==
X-Google-Smtp-Source: AGHT+IH0k2pg+UfjZUCUXy6B3GSaQZKNSoPwEplAwxPZZ8su+HMEjHXGyHj/OtwhoTzIJ0m1HbC6SQ==
X-Received: by 2002:a2e:9a86:0:b0:2bd:180d:67b1 with SMTP id p6-20020a2e9a86000000b002bd180d67b1mr7224708lji.51.1698659417143;
        Mon, 30 Oct 2023 02:50:17 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id hj19-20020a05600c529300b0040841e79715sm8625242wmb.27.2023.10.30.02.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 02:50:16 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/4] pinctrl: qcom: Introduce Pinctrl/GPIO for SM8650
Date:   Mon, 30 Oct 2023 10:50:12 +0100
Message-Id: <20231030-topic-sm8650-upstream-tlmm-v2-0-9d4d4386452d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFR8P2UC/33Nyw6CMBCF4Vchs7amNwi68j0MiwoDTEIpmVaiI
 by7lbh2+Z/FdzaIyIQRrsUGjCtFCnMOfSqgHd08oKAuN2ipjZKqEiks1Iro66qU4rnExOi8SJP
 3wmKLprTYG3WBDCyMPb0O/N7kHimmwO/ja1Xf9cfq8h+7KiGzbbraOuNs9bhNNDsO58ADNPu+f
 wBokGQKxQAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1941;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=oRmTu7gK9K+qp4774LfBnE/qKXVBzCm9HZuGwjD1V2E=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlP3xVKMP93L8Ik6k9FgnT2pKfBoyprYkBE8Q/YKiN
 1C72pdmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZT98VQAKCRB33NvayMhJ0QVGEA
 Czph8LyxHExNGquxpwUXmAm4pbMBqELha45Rw1xjjF3SqyDUqRtI+lb172SOccKH1XIegPG/KcjOsX
 ntQf/l8vFjzEwX98/B7N1vZbci+SsaC8Att41MSQLUvs9YwpWokhL2Lk9+vn5VJzkiBmayaorgtwA7
 qCF24lSBqtJTBJ67qGZxjidq48pasnmSrXh5xJk+5tNscIMfT6znmo3bxaI5GkggY/rUMYII0ZbKR4
 n9ew618rMzjogMqKikNrXLkvbPIukI6FQ7o6F/qYMWAql1qsJScCesDMkrWYbMF1R7y97FnUFymjAD
 D9OEAtVB4i2INsB1mKDw7i5aXWSfVywyH9VO31bhSuPM++vC/WA8pFLl4U1ux6HAWemPPV6TPl/BlW
 Y8+VPoE4KxgQD44clmL68kSM7XrBgXA6EaUCztQ0qXkSGgKspxOfI0GgVyGJfg80YgKl8HFxapon2s
 FuDkFSb8LAtzQltjWMkg8Hhf7LEZd91QABRswctZqTe5yPg7SmMflrtZQcJNO18nCoJsHe0hP5ESK/
 WHdtWJFS3Yyb0uGFuJzJNIoDQRJk4vaSGZkEXJUXtKaEwl+kfkkFL2cKpqdf0E8N61ZyXCusORMQpf
 7hBEpg6vqDtqShC+9T++gBQvuKDR4ivC/wUBcYM0wIwCvK9Kp4Jph+ngX2Mg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The SM8650 Top Level Mode Multiplexer supports 211 GPIOs,
and the usual UFS Reset, SDC Clk/Cmd/Data special pins.

An handful of pins can have their IRQ generated by the PDC
module, and for this support for the new wakeup_present &
wakeup_enable_bit is required to allow the "wakeup" event
to be passed to PDC and generate an interrupt or a wakeup
system event.

As SM8550, it also supports the i2c_pull_bit bit to enable the
on-SoC load resistor for I2C busses.

Dependencies: None

For convenience, a regularly refreshed linux-next based git tree containing
all the SM8650 related work is available at:
https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm8650/upstream/integ

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Collect reviewed-bys
- Fixed unevaluatedProperties handling, and dropped the true properties
- Link to v1: https://lore.kernel.org/r/20231025-topic-sm8650-upstream-tlmm-v1-0-4e3d84a3a46b@linaro.org

---
Neil Armstrong (4):
      dt-bindings: pinctrl: document the SM8650 Top Level Mode Multiplexer
      pinctrl: qcom: handle intr_target_reg wakeup_present/enable bits
      pinctrl: qcom: Introduce the SM8650 Top Level Mode Multiplexer driver
      fixup! pinctrl: qcom: handle intr_target_reg wakeup_present/enable bits

 .../bindings/pinctrl/qcom,sm8650-tlmm.yaml         |  147 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |    8 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-msm.c                 |   42 +
 drivers/pinctrl/qcom/pinctrl-msm.h                 |    5 +
 drivers/pinctrl/qcom/pinctrl-sm8650.c              | 1762 ++++++++++++++++++++
 6 files changed, 1965 insertions(+)
---
base-commit: ed75ce58b3a55d2cd95b68a06fdb010e1e18d825
change-id: 20231016-topic-sm8650-upstream-tlmm-4ece354ef319

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

