Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F13C83CAF0F
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 00:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbhGOWVD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jul 2021 18:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbhGOWVD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Jul 2021 18:21:03 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7340C06175F
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jul 2021 15:18:07 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id go30so11860203ejc.8
        for <linux-gpio@vger.kernel.org>; Thu, 15 Jul 2021 15:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=essensium.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=tnrbGXdXbUE1hKUSpStkYn81T2QxRAL+CFx3vjWTil4=;
        b=W9HNj5+/8Ap4iI+DvpvYkyVPgNw9epgyqHGI955EAPcoa7aJ0zO+zO1werApxqm/HN
         KnlqFJkoja4SIqRgcDR81Lq4xWbYSXp30HnHnh1g8dBqFCr8NmxEKi0j3tJslrUhve0t
         dRs4dC6Ncp9u3JEUkvSk32IhEOK0nAyqG5mHNPGIQrOirLqUieTzP+F8dV+krBOwo8kA
         z1EGGofluryGPdkl+PynAxD0wOveXQziXLw/4aecEl9aIwvzj6RMkwJBMOoGN6xC9OCm
         ubLIGIgjoyFL9+b6puPjZY45Jddsp2thJTd0BkbAs6l13HE/XKbZi/W5U85dRQqqpNw+
         StjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=tnrbGXdXbUE1hKUSpStkYn81T2QxRAL+CFx3vjWTil4=;
        b=rztSeZaWdbAtsjd+u72umf5DshcrYoVG/3FF/IkmpCxHoNCrmGWnnGNl/rTOK4tOmm
         vCxD77JvNIVxxpLfg8Ji30+kSCV8eMh/EoKJU7S8AeJeOEbRp2H6eJxfl7EPys+gtftt
         dZ7uGUZlk44ZLdC7QTT8GZP8vnSYkMgoDbZ7WuMwOKnYaZfu3v38ezELFSSueZW/MaSc
         zjHT2bdsEggZWKBhx6YKTH5HjUWUIkxzfyDiQ0qKQNu54jDRDLozSaoQ6+0c60G028dk
         7t7rIO0MoKchdKf/cyQIc9x1YfeDt3rWs1Fpi6r+IGGoDREkfivA8dcg1vzOXY6j7STe
         EZ5g==
X-Gm-Message-State: AOAM533hSHPUpEMKul4kZ9lKht3S7iqCQUlh03o34E4ixmr9uYefQBI6
        vV2Ajc0Qn6Y/D8JMQBUgXq+Whg==
X-Google-Smtp-Source: ABdhPJy4Bfi5d8w0gEDaodnlyMD66861dEk82eWBWRKROCa7oKLPDAORd8hLp0fWJxtSYhUcWgfByw==
X-Received: by 2002:a17:906:4b47:: with SMTP id j7mr7947083ejv.104.1626387486553;
        Thu, 15 Jul 2021 15:18:06 -0700 (PDT)
Received: from cephalopod (168.7-181-91.adsl-dyn.isp.belgacom.be. [91.181.7.168])
        by smtp.gmail.com with ESMTPSA id ba25sm2923510edb.1.2021.07.15.15.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 15:18:06 -0700 (PDT)
Date:   Fri, 16 Jul 2021 00:18:04 +0200
From:   Ben Hutchings <ben.hutchings@essensium.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH v2 3/3] bindings: cxx: implement C++ bindings
 for libgpiod v2.0
Message-ID: <20210715221803.GA16338@cephalopod>
References: <20210715201001.23726-1-brgl@bgdev.pl>
 <20210715201001.23726-4-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210715201001.23726-4-brgl@bgdev.pl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 15, 2021 at 10:10:01PM +0200, Bartosz Golaszewski wrote:
> This is the bulk of work implementing C++ bindings for the new libgpiod
> API. The tests are not converted yet but the examples are fully
> functional. More details in the cover letter as this patch will be
> squashed with the one for the core C library anyway.
[...]
> +class line_config
> +{
> +public:
> +
> +	/**
> +	 * @brief Direction settings.
> +	 */
> +	enum : int {
> +		DIRECTION_AS_IS = 1,
> +		/**< Request the line(s), but don't change current direction. */
> +		DIRECTION_INPUT,
> +		/**< Request the line(s) for reading the GPIO line state. */
> +		DIRECTION_OUTPUT
> +		/**< Request the line(s) for setting the GPIO line state. */
> +	};
[...]
> +class line_info
> +{
> +public:
> +
> +	/**
> +	 * @brief Direction settings.
> +	 */
> +	enum : int {
> +		DIRECTION_INPUT = 1,
> +		/**< Direction is input - we're reading the state of a GPIO line. */
> +		DIRECTION_OUTPUT
> +		/**< Direction is output - we're driving the GPIO line. */
> +	};
[...]

Could these be enum class types, or does that introduce an ABI issue
if you extend them later?

Ben.

-- 
Ben Hutchings · Senior Embedded Software Engineer, Essensium-Mind · mind.be
