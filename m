Return-Path: <linux-gpio+bounces-298-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7BF7F2141
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Nov 2023 00:15:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF709281ED7
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Nov 2023 23:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251F23B28A;
	Mon, 20 Nov 2023 23:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B1CC1;
	Mon, 20 Nov 2023 15:15:36 -0800 (PST)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-35b144ba935so306025ab.1;
        Mon, 20 Nov 2023 15:15:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700522135; x=1701126935;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oY5J7Q7Bh87QLqEtzkkFLokxl1xQuST2xeMLw4gISwQ=;
        b=GoE8bVamkTmJqAggjp9YGi1T4bktcvKiUd6AReXksRnrJW9dhMx0Ups7NRZxfBuZrZ
         OsV/5RlGYAURHQJEs+wLFcEMDWJCVpXQ6gOdJIEx5OTPhzIXSR7HFbxGJ/pjqcXxxe3d
         q4A7v7+6o+6pgsomt68Lv9GZGNFzOwEs2sFYAnDj1XJLu8SVQQnXyWG+rCEwEEmhhLCJ
         ij+aU3hed76Rot1D7xSN7hxVKm8z8+VPzrnH5tqhJLMl+YVf8oDNamCLtX05izAaeL8G
         gqBG1SKBr4EPDy0A8JI+49WEMGzC0qifymfba85YK/k9tO5Pr++aMEzFr0XoXkIQt6is
         JKLw==
X-Gm-Message-State: AOJu0YweHslRPnG1P9OLbmm6m7LGf5Pc/cfIkdqNhKkUn75bwEkEoXAN
	BpfRiUXmaebd6+y5JNnlzg==
X-Google-Smtp-Source: AGHT+IH9hx2Lz/XIxkLFIUxOIoP+9llZ0Q3H76wLRJe9Z357B1Pd7dlTGI55NnHwh5CKRiPgYoqlFw==
X-Received: by 2002:a05:6e02:16ce:b0:35a:fc1c:1ac7 with SMTP id 14-20020a056e0216ce00b0035afc1c1ac7mr9596630ilx.30.1700522135248;
        Mon, 20 Nov 2023 15:15:35 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id v8-20020a056e020f8800b0035905b40621sm2763008ilo.66.2023.11.20.15.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 15:15:34 -0800 (PST)
Received: (nullmailer pid 3706371 invoked by uid 1000);
	Mon, 20 Nov 2023 23:15:31 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-serial@vger.kernel.org, olof@lixom.net, cw00.choi@samsung.com, andre.draszik@linaro.org, saravanak@google.com, jirislaby@kernel.org, arnd@arndb.de, krzysztof.kozlowski+dt@linaro.org, alim.akhtar@samsung.com, linux-gpio@vger.kernel.org, willmcvicker@google.com, tudor.ambarus@linaro.org, linux-samsung-soc@vger.kernel.org, mturquette@baylibre.com, soc@kernel.org, linux@roeck-us.net, linux-watchdog@vger.kernel.org, semen.protsenko@linaro.org, sboyd@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org, wim@linux-watchdog.org, gregkh@linuxfoundation.org, will@kernel.org, linux-arm-kernel@lists.infradead.org, tomasz.figa@gmail.com, linus.walleij@linaro.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, s.nawrocki@samsung.com, kernel-team@android.com, catalin.marinas@arm.com
In-Reply-To: <20231120212037.911774-10-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
 <20231120212037.911774-10-peter.griffin@linaro.org>
Message-Id: <170052213161.3706337.15818635228108481923.robh@kernel.org>
Subject: Re: [PATCH v4 09/19] dt-bindings: serial: samsung: Make
 samsung,uart-fifosize required property
Date: Mon, 20 Nov 2023 16:15:31 -0700


On Mon, 20 Nov 2023 21:20:27 +0000, Peter Griffin wrote:
> Specifying samsung,uart-fifosize in both DT and driver static data is error
> prone and relies on driver probe order and dt aliases to be correct.
> 
> Additionally on many Exynos platforms these are (USI) universal serial
> interfaces which can be uart, spi or i2c, so it can change per board.
> 
> For google,gs101-uart and exynosautov9-uart make samsung,uart-fifosize a
> required property. For these platforms fifosize now *only* comes from DT.
> 
> It is hoped other Exynos platforms will also switch over time.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  .../bindings/serial/samsung_uart.yaml           | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/serial/samsung_uart.yaml:141:8: [warning] wrong indentation: expected 8 but found 7 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231120212037.911774-10-peter.griffin@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


