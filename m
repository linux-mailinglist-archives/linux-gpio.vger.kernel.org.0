Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9CEC43F47E
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 03:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbhJ2BpS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Oct 2021 21:45:18 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:33530 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhJ2BpR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Oct 2021 21:45:17 -0400
Received: by mail-oi1-f178.google.com with SMTP id bm39so645848oib.0;
        Thu, 28 Oct 2021 18:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4sHQdDY4P05JEnKl7awu/hkkNPAWR0ffqMWRMPagXzw=;
        b=sOJu/JqqXC0wcFJHh5rZTF+187ezgQtdh/VK31U1rGgUnH+xAr/awfs2cEBNnGWUuA
         z4Mq8d2yhL3Afa107E1eghjqvxrqE94KC8FBfHTptdtO7m0vC644EXDv6m9R2pgCLzPY
         8rf5vO6COf3LQYmIJ4+cqho9m0NwTiy/ROZUZKrQrCJf+ylwwdrNjpG9kbPOrdi7REOV
         dRywdiK44m76xVysG1gqAXkrLCOQukGtg1yU+u93FTzL3LuWDCreQUhV9lYgDdEw4NI9
         u66bjkfeg/EGWvUuokZ0UoGdqwbXDmW61w/ECm3Rc/83t4PKHhdTTOHapcGDwKJPnXq2
         EWlw==
X-Gm-Message-State: AOAM531w1ct0WagCcdN+sydYbq1lf6BRoWahDYpBSsMOS9hpreAGGin6
        XZ9E9CV2gkz6O9Khy8jpUA==
X-Google-Smtp-Source: ABdhPJw83q7+d1mdvH3PCYo96B+Ez+4pDfPWmS+v8FCelRGjG4ytJdSiuw3+WU1CVADuFH5DMEd43A==
X-Received: by 2002:a05:6808:f86:: with SMTP id o6mr5539674oiw.68.1635471769478;
        Thu, 28 Oct 2021 18:42:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d25sm341396oti.9.2021.10.28.18.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 18:42:48 -0700 (PDT)
Received: (nullmailer pid 976189 invoked by uid 1000);
        Fri, 29 Oct 2021 01:42:47 -0000
Date:   Thu, 28 Oct 2021 20:42:47 -0500
From:   Rob Herring <robh@kernel.org>
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     Matteo Croce <mcroce@microsoft.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Atish Patra <atish.patra@wdc.com>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        linux-kernel@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Anup Patel <anup.patel@wdc.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-serial@vger.kernel.org, Fu Wei <tekkamanninja@gmail.com>,
        linux-riscv@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Drew Fustini <drew@beagleboard.org>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 07/16] dt-bindings: reset: Add StarFive JH7100 reset
 definitions
Message-ID: <YXtRl3RfbV3HL25z@robh.at.kernel.org>
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-8-kernel@esmil.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021174223.43310-8-kernel@esmil.dk>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 21 Oct 2021 19:42:14 +0200, Emil Renner Berthing wrote:
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> Add all resets for the StarFive JH7100 reset controller.
> 
> Based on work by Ahmad Fatoum for Barebox, with "JH7100_" prefixes added
> to all definitions.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  include/dt-bindings/reset/starfive-jh7100.h | 126 ++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 include/dt-bindings/reset/starfive-jh7100.h
> 

Acked-by: Rob Herring <robh@kernel.org>
