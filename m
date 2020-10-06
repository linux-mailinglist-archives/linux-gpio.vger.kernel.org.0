Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CD92285276
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Oct 2020 21:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbgJFTcn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Oct 2020 15:32:43 -0400
Received: from mail-oo1-f68.google.com ([209.85.161.68]:41556 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbgJFTcm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2020 15:32:42 -0400
Received: by mail-oo1-f68.google.com with SMTP id t3so3477845ook.8;
        Tue, 06 Oct 2020 12:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2JZdwr9tWCXGvHQJ14oYdw8z5bZ6PKaoplwaqiqUKnU=;
        b=YNd8esOk+yXE4nmQ+qJOnQRQaxXpXXsmmRln+OBaMC+ZDlFyAuiBa16PgVzLM/lIOz
         M++1Zx6bXghDQ5iQPI6DXENiCKL1WH62ZbS/CO1Xn7m+GXLeB0W/ZZeXrUpjNtm2B1k2
         E/76Dz47gMd5sNWCW04TQVfPnyIeEnY7LlAvXvX0fhMb7DL3/ZLwh8m01q1vpSy+erEM
         ezm+Abq7GQsTZVyJC9iXg0NEp3+v/23nCIoznZAy+lkFHE+OSFNeqdqqiDsG/Qkm3Fcj
         R5mKIFQ/Z9BXrfU6bI03vm8NpGdHsMivUNX3RtFxJONUzGsTo8S1uk/gqXhOt20WoltB
         4QIg==
X-Gm-Message-State: AOAM53366LsASCnrrn5PLATGqcmVtJPD6o7sICd4nRcYfzZCtP+PaKui
        TRr+F95SNhUNAjMYTCuOZw==
X-Google-Smtp-Source: ABdhPJwvR8yh9bLguba6pAzvHSxtcyoC4GFKVE8goeRO7zeB3uNubvqRgEHLuDQ6hy0FjJ0QvjUacQ==
X-Received: by 2002:a4a:a844:: with SMTP id p4mr4183537oom.59.1602012761899;
        Tue, 06 Oct 2020 12:32:41 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p8sm1506073oot.29.2020.10.06.12.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 12:32:41 -0700 (PDT)
Received: (nullmailer pid 2692694 invoked by uid 1000);
        Tue, 06 Oct 2020 19:32:40 -0000
Date:   Tue, 6 Oct 2020 14:32:40 -0500
From:   Rob Herring <robh@kernel.org>
To:     Mike Looijmans <mike.looijmans@topic.nl>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        robh+dt@kernel.org, bgolaszewski@baylibre.com
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: pca953x: Add support for the
 NXP PCAL9554B/C
Message-ID: <20201006193240.GA2692623@bogus>
References: <20200930092053.2114-1-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930092053.2114-1-mike.looijmans@topic.nl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 30 Sep 2020 11:20:52 +0200, Mike Looijmans wrote:
> The NXP PCAL9554B is a variant of the PCA953x GPIO expander,
> with 8 GPIOs, latched interrupts and some advanced configuration
> options. The "C" version only differs in I2C address.
> 
> This adds the entry to the devicetree bindings.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> v2: Split devicetree and code into separate patches
> 
>  Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
