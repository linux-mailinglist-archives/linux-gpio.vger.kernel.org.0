Return-Path: <linux-gpio+bounces-1374-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F35F8114AA
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 15:32:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B323BB21125
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 14:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69CA2E84F;
	Wed, 13 Dec 2023 14:32:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33293CF;
	Wed, 13 Dec 2023 06:32:46 -0800 (PST)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6d9fdbcec6eso3521982a34.1;
        Wed, 13 Dec 2023 06:32:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702477965; x=1703082765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0kWneZU0gge6lamU79WOa8q8MUgTJ3s6CXlsPKbl1w=;
        b=FyNim23zynxG3N6xA4bc/o/jLotwbc7Hb+nLUZEEgJt+IbkMPm9pQWPzqlafCkPVn9
         Pm+S8li22NhyDP06n6OUVS+eS+25+GI3gN1BYx63X+B9Kgdgmuab/LxU+fqdNOJ8XHMa
         wqaf+XhiRMBis7F+Mh267RDXRzAFw+IFQPsSwfiKQFul2BmzwE7uAewTos4jlYQAzrn5
         YE/AyhY2ov162yMnaWzEnjA5YECMWrdwfx4smiGXw6nu5fdq8HuGSMmUhDOiObJhDZlO
         9sq8HTZ4ul9TVdm9gcdMIZEgTc6IbjbN+jKgYNvLsR2xnMMTshKmH6LzH8Z5diJgEZxm
         OJpg==
X-Gm-Message-State: AOJu0YzmpK+Q8wjv6QTmTUrUPt/AfCQkPuY/zNlYoVWYyljn09/s6hUI
	hF52q0Uu1p3mo2F6yP3HN/nhDAn4MA==
X-Google-Smtp-Source: AGHT+IFWkvHfseSXYTYT3uKdOPAB8K0URkVWZMX3xZ7xanO9ooySMDAjcPKjyJvnnmKaV3WR/fUj1g==
X-Received: by 2002:a05:6830:1b64:b0:6d9:da9f:ab2f with SMTP id d4-20020a0568301b6400b006d9da9fab2fmr7327230ote.27.1702477965392;
        Wed, 13 Dec 2023 06:32:45 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p26-20020a9d695a000000b006d85518ae62sm2776323oto.76.2023.12.13.06.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 06:32:44 -0800 (PST)
Received: (nullmailer pid 1093516 invoked by uid 1000);
	Wed, 13 Dec 2023 14:32:43 -0000
Date: Wed, 13 Dec 2023 08:32:42 -0600
From: Rob Herring <robh@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, arnd@arndb.de, catalin.marinas@arm.com, s.nawrocki@samsung.com, willmcvicker@google.com, gregkh@linuxfoundation.org, linux@roeck-us.net, linux-arm-kernel@lists.infradead.org, kernel-team@android.com, olof@lixom.net, linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org, alim.akhtar@samsung.com, saravanak@google.com, will@kernel.org, cw00.choi@samsung.com, tudor.ambarus@linaro.org, linus.walleij@linaro.org, mturquette@baylibre.com, soc@kernel.org, conor+dt@kernel.org, wim@linux-watchdog.org, sboyd@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-serial@vger.kernel.org, tomasz.figa@gmail.com, linux-gpio@vger.kernel.org, jirislaby@kernel.org, semen.protsenko@linaro.org, krzysztof.kozlowski+dt@linaro.org, andre.draszik@linaro.org
Subject: Re: [PATCH v7 02/16] dt-bindings: arm: google: Add bindings for
 Google ARM platforms
Message-ID: <170247795662.1093374.11352509671907840697.robh@kernel.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <20231211162331.435900-3-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211162331.435900-3-peter.griffin@linaro.org>


On Mon, 11 Dec 2023 16:23:17 +0000, Peter Griffin wrote:
> This introduces bindings and dt-schema for the Google Tensor SoCs.
> Currently just gs101 and pixel 6 are supported.
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> @RobH I removed your 'Reviewed-by: Rob Herring <robh@kernel.org>' tag
> as since you reviewed this I added the empty ect node. Can you please
> do the review again?
> 
> x# Please enter the commit message for your changes. Lines starting
> ---
>  .../devicetree/bindings/arm/google.yaml       | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/google.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>


