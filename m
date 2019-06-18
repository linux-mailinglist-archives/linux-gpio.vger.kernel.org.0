Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB32C4A37C
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Jun 2019 16:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729281AbfFROK1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Jun 2019 10:10:27 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:44719 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbfFROK0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Jun 2019 10:10:26 -0400
Received: by mail-qk1-f195.google.com with SMTP id p144so8593588qke.11;
        Tue, 18 Jun 2019 07:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ymzVRv+HbWASk9IbK9IR5jfXe4p30txsWn7MI2aWfko=;
        b=DOOWp3vW4HwawykDQ1Pi4PSzyzJfFkgUpAfvf3igvw4gXZF41Mzo4LPMBc/wFuOxyj
         E/2KT3DTrrLJ+sEeEXDFA7EpBmwI5jBOS/TYM08CsTGFQmWSFxaTueKQlgqylOxWgWe3
         Spj7JsDpBU3rvPrzEO93Nexo0Zc1GM34St7cdpKA9YwHEiFGhEclq3L9+GpgFxO+LKRu
         svzvOg+fZ9PFaxV67ZYcGW2o7+SkUt9jyOy3GhjF8vt/X+2nhdSJuSizZyF4CXe5R2Bt
         4kmgX36oU8/3yA9m3KUBn/M2PaLTWftzs/4MXiei4dNijc5WKT/ZAdYmmsUUmEjsEePq
         dfbg==
X-Gm-Message-State: APjAAAWncFOW1ieSn3+JMmOVhYFVZn6YzLJ0qtz2gPRxP3p2Pa/Z1d7Q
        FWVUbVEXcn3EF5gZ/a4XtQ==
X-Google-Smtp-Source: APXvYqzTd+SUScnI+raBK375orxhwOZtIjBl7LTQ+SrdOuzX+fB6KoQ7w06WVT6SBK2QaP+LwnqcBg==
X-Received: by 2002:a37:9ece:: with SMTP id h197mr75339469qke.50.1560867025673;
        Tue, 18 Jun 2019 07:10:25 -0700 (PDT)
Received: from localhost ([64.188.179.192])
        by smtp.gmail.com with ESMTPSA id s11sm9602685qte.49.2019.06.18.07.10.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 07:10:25 -0700 (PDT)
Date:   Tue, 18 Jun 2019 08:10:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mark Rutland <mark.rutland@arm.com>, openbmc@lists.ozlabs.org,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: Add missing newline at end of file
Message-ID: <20190618141023.GA20154@bogus>
References: <20190617143322.4332-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617143322.4332-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 17 Jun 2019 16:33:22 +0200, Geert Uytterhoeven wrote:
> "git diff" says:
> 
>     \ No newline at end of file
> 
> after modifying the files.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/ipmi/npcm7xx-kcs-bmc.txt      | 2 +-
>  .../devicetree/bindings/pinctrl/nuvoton,npcm7xx-pinctrl.txt     | 2 +-
>  Documentation/devicetree/bindings/regulator/pv88060.txt         | 2 +-
>  Documentation/devicetree/bindings/sound/cs42l73.txt             | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 

Applied, thanks.

Rob
