Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E70D37554D
	for <lists+linux-gpio@lfdr.de>; Thu,  6 May 2021 16:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234303AbhEFOCK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 May 2021 10:02:10 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:46899 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234300AbhEFOCK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 May 2021 10:02:10 -0400
Received: by mail-oi1-f172.google.com with SMTP id m13so5534191oiw.13;
        Thu, 06 May 2021 07:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8zj4QLZNWRHiGDPqdL6BlLDEWMBnGyb+CqbD9q2MUUE=;
        b=rFiPg+ZHe6WYYiZmC6L/Uh52CnC47Q6iFabk5VEFmmENCdIEZan54sGqbz2DM3D0XB
         kytuYzN4Z8UvJVvzwQCpON6qkuGQs6T4jVrx6McJeYA05kd152swGiqG6cr/Z9HIj23O
         ZHzDqGPxw9Azc2GTrZUg09Lqd4KeBwGBeTHgK6zFx0JUhDx66GdWlkym6TDdmx8wsA19
         46MVHE1g372R/7kaLsEsZu3oYK1D1XHH0wbWie7zFg9iC/Al+lH/ZhYOAbXJ9a6V+xOS
         vs4O+WuYvjYDHJDe4m84FTYoR6IdeztKDIczqENQcHRZkhQbuxxvEdmE3n6k7RGrh+Ol
         AVYg==
X-Gm-Message-State: AOAM5336X8gPC/nQrAhljws98czqMTrLLBuvJzIKwKKLaxS5puyqRS1J
        4YaMz7vvVYZPrScONdOnpQ==
X-Google-Smtp-Source: ABdhPJwO3Dj9RVUDgMM7M71O9Tu2qbXZmc+Ho2Ai+tYQUs2/ytxM5R3ExqXA1YNmuvTh5AZirKlzbA==
X-Received: by 2002:aca:d70b:: with SMTP id o11mr3158686oig.151.1620309670862;
        Thu, 06 May 2021 07:01:10 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d19sm523746oop.26.2021.05.06.07.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 07:01:09 -0700 (PDT)
Received: (nullmailer pid 245825 invoked by uid 1000);
        Thu, 06 May 2021 14:01:07 -0000
Date:   Thu, 6 May 2021 09:01:07 -0500
From:   Rob Herring <robh@kernel.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-hwmon@vger.kernel.org, jmp@epiphyte.org,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        luka.perkov@sartura.hr, linux@roeck-us.net, lee.jones@linaro.org,
        buczek@molgen.mpg.de, jdelvare@suse.com, pmenzel@molgen.mpg.de,
        devicetree@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: mfd: Add Delta TN48M CPLD drivers
 bindings
Message-ID: <20210506140107.GA245775@robh.at.kernel.org>
References: <20210430123511.116057-1-robert.marko@sartura.hr>
 <20210430123511.116057-5-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210430123511.116057-5-robert.marko@sartura.hr>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 30 Apr 2021 14:35:10 +0200, Robert Marko wrote:
> Add binding document for the Delta TN48M CPLD drivers.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  .../bindings/mfd/delta,tn48m-cpld.yaml        | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
