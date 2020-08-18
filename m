Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9ADE247C12
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Aug 2020 04:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbgHRCM5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Aug 2020 22:12:57 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:44109 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgHRCM4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Aug 2020 22:12:56 -0400
Received: by mail-il1-f195.google.com with SMTP id j9so16271247ilc.11;
        Mon, 17 Aug 2020 19:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F2ozg3p1TaGfvG4hn6ZyxlYNlkCvnDuks95rx++93Co=;
        b=qhwR6xM2481BPoCC+gf5TwNRMaFyMOtB7hoeva3V0cNDF5NYxES6Uhdu/eYQim1luO
         KiD4g2gjhc2aQMFMtIC2R8aAvDoiFdOhTf+W8Patv+msRMG2Nmjusp5JVnZGADl3QKD1
         JpRJAoeW0UiBeq5UYtKC6GGDOFbBEc+r6fZ2DNlnV+V2lEEeIk7+Ga27yYjmppuXo5Gj
         gFwO9DkFgl52ZvgfSsJwOlhEeENR2wSoBp8w5c7wkBdfTcIWyxyLHzjmH7EtZwq/xmiY
         k8mzXt17thTWIGUbdM9YXpHT3xpes0Sv+/RD8aHWval4anPfXB1IhbMuWkIsw/UP2E0O
         KN6A==
X-Gm-Message-State: AOAM531EPb4xV62aqOPvnuZ6dzFnQi7urnTOMM1oUaCy3Vy93cVT2aja
        pvYZ4dwk4um4EZ1abAUEiE3+DKFwAQ==
X-Google-Smtp-Source: ABdhPJxfDQ7MtcG3HyLkcrF3+gQQboetrX5wr9jHyDKiTs4H/J4ci/iYhQT63F+YK0OqKREGEN6B8Q==
X-Received: by 2002:a92:6b0d:: with SMTP id g13mr16804857ilc.255.1597716775253;
        Mon, 17 Aug 2020 19:12:55 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id f132sm10056818ioa.45.2020.08.17.19.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 19:12:54 -0700 (PDT)
Received: (nullmailer pid 2143393 invoked by uid 1000);
        Tue, 18 Aug 2020 02:12:51 -0000
Date:   Mon, 17 Aug 2020 20:12:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, Linux-imx@nxp.com,
        linus.walleij@linaro.org, stefan@agner.ch
Subject: Re: [PATCH V2] dt-bindings: gpio: Convert vf610 to json-schema
Message-ID: <20200818021251.GA2143309@bogus>
References: <1597218741-24899-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1597218741-24899-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 12 Aug 2020 15:52:21 +0800, Anson Huang wrote:
> Convert the vf610 gpio binding to DT schema format using json-schema.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> changes since V1:
> 	- fix reg property to pass build;
> 	- add "additionalProperties: false".
> ---
>  .../devicetree/bindings/gpio/gpio-vf610.txt        | 63 -----------------
>  .../devicetree/bindings/gpio/gpio-vf610.yaml       | 81 ++++++++++++++++++++++
>  2 files changed, 81 insertions(+), 63 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-vf610.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> 

Applied, thanks!
