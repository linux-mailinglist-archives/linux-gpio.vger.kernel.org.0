Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4294C7867E
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 09:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfG2Hmr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 03:42:47 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46477 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbfG2Hml (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jul 2019 03:42:41 -0400
Received: by mail-wr1-f67.google.com with SMTP id z1so60616598wru.13
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2019 00:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=qcDHQ1YIyua0Lz0XKlvtzGchQOF/q8YhLFhQTQqfSnA=;
        b=02iwdyH22+odFMvWr/fUSOWV/YsZSHqKDJDdL3e/jHLksFamrMNdydoLixPsostjig
         yYzQEFDjoaLkJAPyPt/dX5djgi4pTpVW7k5O+EuK9vRV4b+kvVD3KdHyP+fHdAXOLJZw
         fs4K6etimfyGJgHmMkzEWYXpz0YXtnA5d3Ujv3pcGXoUovVU2fuxrFw2Zx9N+4HQJ2Xh
         6ZfZtL98PhcYOUCA0uf9O/gU8Ho3Ar5Xd5LTTZyfiGybMwcM7ykT0tlFaILBVDsfNIyn
         qOJAT7FJydgp4as6OIcwX3bPsXYJAYc4F7EkgbuacqIjLhJho48k5LzbAupoJo3tSI69
         B2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=qcDHQ1YIyua0Lz0XKlvtzGchQOF/q8YhLFhQTQqfSnA=;
        b=erhcNyXGeooCFisP9o2izefWyRL1eO95n/f1l/lOl6dzbesh1RdXHsPLKetOxwpzVG
         AWXs6WZqK881LwneN93ZIan2+vOUnfDiBfPVW6kzYLGmbOjo7Pp/S/Xd67g7oeOyEUMJ
         oKFWaTeMoTUJO7D/UWpOEzEp48CzI/87IZ44WiWhkcCuCQKqH/4VZ4ArdoxB3jwlDcvH
         y4I2EbzhUrIchjw2Vm0PP/wUVPRRoHxeGgREpvZGxC9CE73IcjA4EV31lQOO2b9nCiz1
         7TwL+cqtuJPlvbXz+Iq5UX2u8fRMXUsMHsOrwjYM8UpwTF7SVQoCZIobcQLGo1ccU+te
         XfJA==
X-Gm-Message-State: APjAAAVmTVLBrTSZRQOPECQwh+URBv76QTgi8GqttWlfekvcjKyL+t03
        3LQ+9fdi5Mx9AfXiZwAIbV+SFQ==
X-Google-Smtp-Source: APXvYqyu0KuT71WZYrYu+y1RASylJuxEoqAUq39HAC9JSxF3uZuROG3LU/D595xuazk7xstMkJnTUA==
X-Received: by 2002:adf:cd04:: with SMTP id w4mr69069194wrm.230.1564386159762;
        Mon, 29 Jul 2019 00:42:39 -0700 (PDT)
Received: from localhost ([2a01:e34:eeb6:4690:ecfa:1144:aa53:4a82])
        by smtp.gmail.com with ESMTPSA id m24sm37058830wmi.39.2019.07.29.00.42.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 00:42:39 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org
Subject: Re: [RFC/RFT v3 04/14] clk: meson: eeclk: add setup callback
In-Reply-To: <55ce9b5e-de2f-9da3-8eec-13b5ead23e6c@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com> <20190701091258.3870-5-narmstrong@baylibre.com> <1jh8836w49.fsf@starbuckisacylon.baylibre.com> <55ce9b5e-de2f-9da3-8eec-13b5ead23e6c@baylibre.com>
Date:   Mon, 29 Jul 2019 09:42:37 +0200
Message-ID: <1j1ry9s2vm.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri 26 Jul 2019 at 16:50, Neil Armstrong <narmstrong@baylibre.com> wrote:

> On 03/07/2019 16:17, Jerome Brunet wrote:
>> On Mon 01 Jul 2019 at 11:12, Neil Armstrong <narmstrong@baylibre.com> wrote:
>> 
>>> Add a setup() callback in the eeclk structure, to call an optional
>>> call() function at end of eeclk probe to setup clocks.
>>>
>>> It's used for the G12A clock controller to setup the CPU clock
>>> notifiers.
>> 
>> I'd prefer if you implement the probe function in the related controller
>> have this probe function call meson_eeclkc_probe() for the common part
>> 
>> In your case, I suppose it means implementing the g12a controller probe
>> to deal with the notifiers
>
> Sure, but with this eeclk setup callback I can provide a different setup() callback
> for g12a and g12b (and later sm1), without this means adding a top data struct
> containing a setup() callback pointer and the soc meson_eeclkc_data struct to be able
> to call a setup() for each family like done actually, but this will broke eeclk since
> the match_data data won't be a meson_eeclkc_data() struct anymore.

meson_eeclkc_probe is an helper we added to factorize common code out of the
clock controllers we had. I don't like the idea to now add callback in it
deal with the specifics of each SoCs. It feels like we are going in circles.

I think SoC/controller specific stuff should be dealt with in
related probe function of each clock controller which would then call
the 'common helper' if necessary.

If the common part interface needs to be reworked, maybe changing
the parameters, I'm ok with it.

>
> If you still prefer this, I can rework it like that.
>
> I'm rebasing all the stuff on v5.3-rc1 and plan to repost an updated version
> shortly, solving this would be easier.
>
> Neil
>
>> 
>>>
>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>> ---
>>>  drivers/clk/meson/meson-eeclk.c | 6 ++++++
>>>  drivers/clk/meson/meson-eeclk.h | 1 +
>>>  2 files changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
>>> index 6ba2094be257..81fd2abcd173 100644
>>> --- a/drivers/clk/meson/meson-eeclk.c
>>> +++ b/drivers/clk/meson/meson-eeclk.c
>>> @@ -61,6 +61,12 @@ int meson_eeclkc_probe(struct platform_device *pdev)
>>>  		}
>>>  	}
>>>  
>>> +	if (data->setup) {
>>> +		ret = data->setup(pdev);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +
>>>  	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>>>  					   data->hw_onecell_data);
>>>  }
>>> diff --git a/drivers/clk/meson/meson-eeclk.h b/drivers/clk/meson/meson-eeclk.h
>>> index 9ab5d6fa7ccb..7fdf424f71a6 100644
>>> --- a/drivers/clk/meson/meson-eeclk.h
>>> +++ b/drivers/clk/meson/meson-eeclk.h
>>> @@ -20,6 +20,7 @@ struct meson_eeclkc_data {
>>>  	const struct reg_sequence	*init_regs;
>>>  	unsigned int			init_count;
>>>  	struct clk_hw_onecell_data	*hw_onecell_data;
>>> +	int				(*setup)(struct platform_device *pdev);
>>>  };
>>>  
>>>  int meson_eeclkc_probe(struct platform_device *pdev);
>>> -- 
>>> 2.21.0
