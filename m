Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82DFD3DADB3
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jul 2021 22:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233037AbhG2UfA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jul 2021 16:35:00 -0400
Received: from mail-io1-f46.google.com ([209.85.166.46]:39593 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229845AbhG2UfA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jul 2021 16:35:00 -0400
Received: by mail-io1-f46.google.com with SMTP id f6so2930853ioc.6;
        Thu, 29 Jul 2021 13:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CqALBB8XhPNYm5eLzHeFRxLWidIlyWJVj8jddlP39GU=;
        b=Z1Qrz8Katmze6MWkKWtAIpgU6qNpnttx1t4b8zA9qObBWebuPLbLq+KHhK7cMxXzoQ
         xZ92G1WeNuwZuJVYYXfw5kLXdtErYYokI+5ZuFLQEFSxvaaikTuJMGnR75+8VGghOCV2
         MNZfGnzFqjiY3Idzm67tdAH5mXHLZO7MG8y9b3vPqRVBVm9BtHKyGWE1YSm98vJMmrbX
         UD49DLEcSz+xKdF1Zuh0U5+NMq3X3YVlTVF6MR4pZ8t0DhEmWdwHcIJM4/u9cixtY3mS
         yXWW1nxPvfd9Na7Wb3ivj/UoZwq+N8u7EI1M0dWWWWCIzmltvJGDmVZO7/oQaV7VNvcL
         Iz7Q==
X-Gm-Message-State: AOAM531/jEDn2HZ6AFnkDTGttZXJSMaqq8WQqelS773IctEM7V586tZN
        l3kBSbkTE+fThQwZto+tyg==
X-Google-Smtp-Source: ABdhPJxdly129GaGJvxacE8bh5T0mHrK/8Bw2MEIumv9TdtuedugLkq1vJTHXmibL/FhkpLtlTkrew==
X-Received: by 2002:a5d:8b03:: with SMTP id k3mr5389228ion.203.1627590895542;
        Thu, 29 Jul 2021 13:34:55 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id j2sm2552163ilr.80.2021.07.29.13.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 13:34:53 -0700 (PDT)
Received: (nullmailer pid 840743 invoked by uid 1000);
        Thu, 29 Jul 2021 20:34:52 -0000
Date:   Thu, 29 Jul 2021 14:34:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     robh+dt@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-gpio@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linux-doc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Olof Johansson <olof@lixom.net>, arnd@arndb.de
Subject: Re: [PATCH 6/7] dt-bindings: stm32: document stm32mp135f-dk board
Message-ID: <YQMQ7CWKB2vK7GwZ@robh.at.kernel.org>
References: <20210723132810.25728-1-alexandre.torgue@foss.st.com>
 <20210723132810.25728-7-alexandre.torgue@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723132810.25728-7-alexandre.torgue@foss.st.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 23 Jul 2021 15:28:09 +0200, Alexandre Torgue wrote:
> Add new entry for stm32mp135f-dk board.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 

Acked-by: Rob Herring <robh@kernel.org>
