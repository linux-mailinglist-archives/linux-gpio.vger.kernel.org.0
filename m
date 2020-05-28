Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 484101E6D94
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 23:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436535AbgE1VYj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 17:24:39 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:45259 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436519AbgE1VYh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 17:24:37 -0400
Received: by mail-il1-f194.google.com with SMTP id 9so369569ilg.12;
        Thu, 28 May 2020 14:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e1ym1YauAZZrFVqJD4LN1RKW6wk5ShihqT0BZZ1ZIYA=;
        b=sMG4PFDVH0fcse4mdM50MFlD9oiyGGakPH76IuLZcvS+WtR6Wikibyq3T5XbXkrwdH
         VtRUPDC4I21gb/D0iLwNMBQky1Hgeoe+lajFd3LfnmaZuM2u9F/W3hV27P1MqQDQiAB1
         ilYvHWZNWUYBZNALurrfrnTTZGerwqB3GEwMvaZ76fmVKUOK7I6QWC9LgPn1Bh0srb01
         OK4WSfaV+IFzPvMXDpJ1Hf5EWMP43D41LK+Hftmbt08Pr4by9JD5+sL9VA7+I2aKunO0
         gq5Dv0fCQUjgGxqKhDVBY2KCcH1dv1jySV8yFI4NJUfqMiVhAdX9WhRRD64LdI/t5Ke9
         ax4w==
X-Gm-Message-State: AOAM531HIW1KTUmZWOSD9HcwEdCzmv0YjxZQdSIekkFnGQkBq/k1S3F+
        uj0IGs5m2H7W9eRPi76Z1Q==
X-Google-Smtp-Source: ABdhPJzLys4LqNNTM+uXr3P8ZG3ucUPZYA0MiBD/sMuIalmC121EG5wOG16FEhWuQR9/riSxL5LU9Q==
X-Received: by 2002:a92:850c:: with SMTP id f12mr4799867ilh.86.1590701075373;
        Thu, 28 May 2020 14:24:35 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id 17sm3730810ill.14.2020.05.28.14.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 14:24:34 -0700 (PDT)
Received: (nullmailer pid 711562 invoked by uid 1000);
        Thu, 28 May 2020 21:24:33 -0000
Date:   Thu, 28 May 2020 15:24:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bgolaszewski@baylibre.com, s.hauer@pengutronix.de,
        festevam@gmail.com, linux-gpio@vger.kernel.org,
        shawnguo@kernel.org, linus.walleij@linaro.org,
        kernel@pengutronix.de, robh+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: Convert mxs to json-schema
Message-ID: <20200528212433.GA711514@bogus>
References: <1589934035-5309-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589934035-5309-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 20 May 2020 08:20:35 +0800, Anson Huang wrote:
> Convert the MXS GPIO binding to DT schema format using json-schema.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  .../devicetree/bindings/gpio/gpio-mxs.txt          |  88 -------------
>  .../devicetree/bindings/gpio/gpio-mxs.yaml         | 136 +++++++++++++++++++++
>  2 files changed, 136 insertions(+), 88 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-mxs.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mxs.yaml
> 

Applied, thanks!
