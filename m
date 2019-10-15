Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF3D6D7D8E
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2019 19:24:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730643AbfJORYD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Oct 2019 13:24:03 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41346 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbfJORYD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Oct 2019 13:24:03 -0400
Received: by mail-ot1-f65.google.com with SMTP id g13so17625721otp.8;
        Tue, 15 Oct 2019 10:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AMnuJgHGU6R0IzytORO8cFlW8ykU5YUSocCPPL5eBC4=;
        b=UEiJXYbXmrIOZRPiKZBaVt+kyPYDy/vH44IePvqy+WVoUHfMvdBLwewfDrU+AXGbHE
         HZMSpz5R6JKF+dm7tDI+Ndb1dfJXp/pvyua/GsbHHvCIcW6lBm69Dx7xDI0JMzK3is/c
         Ssza4d3tM6KkMgDHcsEMMquLa9Ohi1qDbvFeC0cLPqD0P4t0rlYAx9moGLkpO2IrK2yL
         Xsnw36SjMUdcfZ0mbjJr7OdUQ+fQIQbbZ6Xz7uk2k+dpMhwHjB/th0vLgC0Sby8wvWCe
         83dqm79YKPYEJY1k3EBM3tUG3wQjhd1Atow79jcDilPXXI9Il9mXlfVIe4oWFZIS0wrY
         GSrQ==
X-Gm-Message-State: APjAAAWK+pLUUAUEF8UGmGyhLy08rzhj5kn8AXMlWWsWzE97lpoQgw9N
        XS48O1KcJ9uqhV6RUgpARA==
X-Google-Smtp-Source: APXvYqxeAQyn2woHyJsNz/1A9Qqotnbqgu/lYixgaEz9AtYG4uiKdx1AbMY3H/CJDkTrB7+S/N/KHQ==
X-Received: by 2002:a05:6830:22ce:: with SMTP id q14mr3987927otc.115.1571160242078;
        Tue, 15 Oct 2019 10:24:02 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d194sm6658461oib.47.2019.10.15.10.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 10:24:01 -0700 (PDT)
Date:   Tue, 15 Oct 2019 12:24:00 -0500
From:   Rob Herring <robh@kernel.org>
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: usb: generic-ehci: Add "companion" entry
Message-ID: <20191015172400.GA724@bogus>
References: <20191007134410.10337-1-alexandre.torgue@st.com>
 <20191007134410.10337-4-alexandre.torgue@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007134410.10337-4-alexandre.torgue@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 7 Oct 2019 15:44:10 +0200, Alexandre Torgue wrote:
> "companion" entry is present in "generic.txt" usb binding file. This commit
> adds it also in generic-ehci yaml binding.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
> 

Applied, thanks.

Rob
