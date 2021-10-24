Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5FB438A4B
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 17:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbhJXPoM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 11:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232280AbhJXPnd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 11:43:33 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D9BFC07978D;
        Sun, 24 Oct 2021 08:40:51 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id o12so8133725qtq.7;
        Sun, 24 Oct 2021 08:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qcrI4wP6nWNeQuDo4rvfqoTQ/bG/63LjB2/3WWBKi4U=;
        b=N1KF1dRokm5UGVDxerlKDpwcITBd+JjD7mIyWVReQVnVXTQC6JdDm5o6Wsr0vCwXbs
         uz686H4V7mzmgPvPteXIhiVnpJdDDmbZtMd3WIbRkKPjD6Oc2E0I0kAEzqHGugKtoF9i
         qvNwEDckoLv48aR5V58OylhIkEIrPyRqVBJtPNbnvbwBtEY5u8NPpl1vUusrosMdfeHV
         X9ke1Oin8AcUItmLEbdZjZl8RgrXqNU/d/eB+oJXRDMsS2g3Zjz2OIHwd2MpBj7DNaK9
         SBqMWWFr2w9aIQk5ZYToS8O8zyApVYp+IH+dhx51/S/EaEVFDKJ3cziz+eh9lpTfGSao
         c32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qcrI4wP6nWNeQuDo4rvfqoTQ/bG/63LjB2/3WWBKi4U=;
        b=izT2KhP/paUifzvNocACHQIHlsBSTMNxHUvBEAmiu8hA6OYFqeHA5Qv/QHrrpoRzaz
         69yMMbG89nUgKQZ8aWogztUAS/TUbEmpRl/p9Ow60Olztn7m5cYcSVv6QgfEEV5+rDuY
         zbCFCQaMfMhorKCwXOZMkozhCl/FxL8F4oaT+/x+lBdBzxThgFfgwno3LEI50A1FnIRp
         aoqqgR3RuVXx9eSDgynHbjQJ/4K0jhTHV8FYf2/tMv3tsl4gcsOwXcQcbeVIZ2+lZSNN
         Nn1hPzI5Ygng+25hhN9+bMdCx0cICZopG7dyYITJretckfvQD/0y7WjeHEVG0ZClXJ7/
         d6ZQ==
X-Gm-Message-State: AOAM532vWU7c2acZgVj6coeQAWgqm/MwEC5zx7wJekU8++JsEZBTxpcH
        /BSU7+xIYlrwzLAl4hpXYC8=
X-Google-Smtp-Source: ABdhPJwHfYoV/7vYQousF4pHNtL/Od1EtRnn48ZFUZoXV6WokybqH8vfSKuOmPZ3wDakFAVwaooIaA==
X-Received: by 2002:a05:622a:244:: with SMTP id c4mr12491114qtx.186.1635090050570;
        Sun, 24 Oct 2021 08:40:50 -0700 (PDT)
Received: from jesse-desktop.jtp-bos.lab (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id x9sm7291731qtw.84.2021.10.24.08.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 08:40:50 -0700 (PDT)
From:   Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To:     linux-imx@nxp.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, leonard.crestez@nxp.com,
        b20788@freescale.com, Mr.Bossman075@gmail.com, fugang.duan@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT compatible
Date:   Sun, 24 Oct 2021 11:40:22 -0400
Message-Id: <20211024154027.1479261-9-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add i.MXRT documentation for compatible string.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index a90c971b4f1f..4b4340def2aa 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -21,6 +21,7 @@ properties:
           - fsl,ls1028a-lpuart
           - fsl,imx7ulp-lpuart
           - fsl,imx8qm-lpuart
+          - fsl,imxrt-lpuart
       - items:
           - const: fsl,imx8qxp-lpuart
           - const: fsl,imx7ulp-lpuart
-- 
2.33.0

