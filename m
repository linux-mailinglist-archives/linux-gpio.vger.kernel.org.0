Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9C33154AD
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 18:09:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232875AbhBIRIe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 12:08:34 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:34108 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232877AbhBIRI2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 12:08:28 -0500
Received: by mail-ot1-f53.google.com with SMTP id y11so18140912otq.1;
        Tue, 09 Feb 2021 09:08:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=17f3kkBqUdZrHURKPOsXQiGxbiGj0w4p0Y6sE1YIXfI=;
        b=Ek8vETojol8V3/3WEHwm1FCHtAuMVcbOef1pyymXrtiNoGYpjK0yqAo0oioXSjo2Hn
         hefjHKRljOnSBZda8/xh/77aVaTW0oScrxfLU0KR4tCxOxWAdL/tESawmQj+3agRKFw7
         se13OugH2+fcZlUR1X4+kD/bNLvzSgnKvkZltsTenOhafPrQTgBYSwr4/n6b7n1e7iEy
         W/Mxf0ooTYWTQ9N7eVxz3bKBWLpZehngrVo0VyOrZEBGM67PjjPXHPJ75u1ilne/QrsO
         OJTyBhkPEhdP7XtYd2KMTEQiQmhGy0IExZ3VMV3B3oIUAE4i5d9NAttbORFidppgLZH+
         m5Rw==
X-Gm-Message-State: AOAM530m1L9Y+BEtk2DDrAlTlgIi8qX3z2GnlHyNce7FF7gvQI+r+7cb
        Tp6W/PQwItJNuyd5tJCPNg==
X-Google-Smtp-Source: ABdhPJwbN5JoKDX4ZhlXhc0wpO3RziRRaSgramnMuzTzaL6wP/AbLA3VMQ9hFf6Ig6lew9+cmIv7Lg==
X-Received: by 2002:a05:6830:90a:: with SMTP id v10mr16742679ott.364.1612890466659;
        Tue, 09 Feb 2021 09:07:46 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id b25sm1450568otf.16.2021.02.09.09.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 09:07:45 -0800 (PST)
Received: (nullmailer pid 3944753 invoked by uid 1000);
        Tue, 09 Feb 2021 17:07:44 -0000
Date:   Tue, 9 Feb 2021 11:07:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: qcom: Add sc8180x binding
Message-ID: <20210209170744.GA3944698@robh.at.kernel.org>
References: <20210126042650.1725176-1-bjorn.andersson@linaro.org>
 <20210126042650.1725176-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126042650.1725176-2-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 25 Jan 2021 20:26:49 -0800, Bjorn Andersson wrote:
> Add binding for the TLMM block in the Qualcomm SC8180X platform.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../pinctrl/qcom,sc8180x-pinctrl.yaml         | 152 ++++++++++++++++++
>  1 file changed, 152 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
