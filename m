Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6770246078B
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Nov 2021 17:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245669AbhK1Qgz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Nov 2021 11:36:55 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:43627 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358307AbhK1Qez (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Nov 2021 11:34:55 -0500
Received: by mail-oi1-f179.google.com with SMTP id o4so29660549oia.10;
        Sun, 28 Nov 2021 08:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PkR4wRUK5gkI0Qw8lNcjmLEGMLEhW9tgrTYzttS33uY=;
        b=Xc1WS0RXQYM8BxuawTeL/uaQEAOWM99iZjyQh0TWpWNJRyBM+1dXzb5UFouZf69QlZ
         vSSnWQkO1/0GowP7Zy+9kA9OVvXXYywekrigkie2ZqzCd7S7UayerZrPEWEFQnxKo07a
         xBjc2YJqcuvzpGDFDmrspS4GTYcOdC2XS8o3F9HGYnglk3dApHWhEqm5YVbiH6VQBQ33
         Bp8dCCpkPZ6jmHrQZlop1Jsm2icDqFnyn4UgBppA6QMBMorkpKCYRDiIzkZFgj48CKjU
         S9YnG5+ISwyFlahzHF1PjTcU6zhwe4Xb4IZCRe5Dq5lXHzhfKa5RysbBR4EKVDWc6p3i
         4kQQ==
X-Gm-Message-State: AOAM530jUgt2+qL3K7EnZ4kb+Zbpmt66pF7iChYlXxbasQIYB8jvF//n
        GyKpbEmCERQVHomjcSvynUeZbMt65Q==
X-Google-Smtp-Source: ABdhPJwH0qeDBaA8EBBP3qVVXiWISZ5v/PIXfPeSNWbUx58MHSW8/zktshdevP9pgdEmMr7y4DDarw==
X-Received: by 2002:a05:6808:150d:: with SMTP id u13mr35388484oiw.155.1638117098512;
        Sun, 28 Nov 2021 08:31:38 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20d6:afc8:f6e9:d57a:3e26:ee41])
        by smtp.gmail.com with ESMTPSA id 184sm1220819oih.58.2021.11.28.08.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 08:31:37 -0800 (PST)
Received: (nullmailer pid 2677086 invoked by uid 1000);
        Sun, 28 Nov 2021 16:31:33 -0000
Date:   Sun, 28 Nov 2021 10:31:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jesse Taube <mr.bossman075@gmail.com>
Cc:     linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT
 compatible
Message-ID: <YaOu5XQZhejJCl1n@robh.at.kernel.org>
References: <20211125211443.1150135-1-Mr.Bossman075@gmail.com>
 <20211125211443.1150135-9-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125211443.1150135-9-Mr.Bossman075@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 25, 2021 at 04:14:38PM -0500, Jesse Taube wrote:
> From: Jesse Taube <mr.bossman075@gmail.com>
> 
> Add i.MXRT documentation for compatible string.
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1->V2:
> * Nothing done
> V2->V3:
> * Rename imxrt to imxrt1050
> ---
>  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>
