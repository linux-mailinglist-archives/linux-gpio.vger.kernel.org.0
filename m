Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB140227287
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 00:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726030AbgGTW47 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 18:56:59 -0400
Received: from gateway20.websitewelcome.com ([192.185.52.45]:40443 "EHLO
        gateway20.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726021AbgGTW47 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Jul 2020 18:56:59 -0400
X-Greylist: delayed 1423 seconds by postgrey-1.27 at vger.kernel.org; Mon, 20 Jul 2020 18:56:57 EDT
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
        by gateway20.websitewelcome.com (Postfix) with ESMTP id 57D0C4027ED0A
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 16:11:25 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id xeLRjkfqzhmVTxeLRjAaRp; Mon, 20 Jul 2020 17:33:13 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References:To:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=01NS3JuGX2c6PZwb0z4SqWxVvVSVW98j3M611yihqEM=; b=URFpYnlsIYmkfiDEguZw+/2BAW
        dhBmfyJPFz545Mvzy5Oer3DyBTI6N0ifkVHQfFYJxEkF/gxtYuQig0m/0EiEzsGnnwY3oDas9ontq
        4/Z41nwsbprpjUIIkl9eZMcj00K8VZ+bKk3pVy+vGvI5XuWFKgTlVdzLSpnUMvnRfHzxvUW5cEcuW
        2heRViiVfqgM26ufKTd/U+E6W8QN9zXn+tva9DIwIZd2TFHs5KSVfejkWvE5JBYBOkYsnHlue80VD
        BiVgYf7NrrW3dO0GXupmXBj+QwYMtxd6NTSsx5/10EJxg8lS4rySYacUiF7F08kgAZmBxcocumq7B
        +Umxl6bQ==;
Received: from [200.68.140.17] (port=18421 helo=[192.168.43.132])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <gustavo@embeddedor.com>)
        id 1jxeLR-003Y1j-5s; Mon, 20 Jul 2020 17:33:13 -0500
To:     Drew Fustini <drew@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
References: <20200717194043.1774643-1-drew@beagleboard.org>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 xsFNBFssHAwBEADIy3ZoPq3z5UpsUknd2v+IQud4TMJnJLTeXgTf4biSDSrXn73JQgsISBwG
 2Pm4wnOyEgYUyJd5tRWcIbsURAgei918mck3tugT7AQiTUN3/5aAzqe/4ApDUC+uWNkpNnSV
 tjOx1hBpla0ifywy4bvFobwSh5/I3qohxDx+c1obd8Bp/B/iaOtnq0inli/8rlvKO9hp6Z4e
 DXL3PlD0QsLSc27AkwzLEc/D3ZaqBq7ItvT9Pyg0z3Q+2dtLF00f9+663HVC2EUgP25J3xDd
 496SIeYDTkEgbJ7WYR0HYm9uirSET3lDqOVh1xPqoy+U9zTtuA9NQHVGk+hPcoazSqEtLGBk
 YE2mm2wzX5q2uoyptseSNceJ+HE9L+z1KlWW63HhddgtRGhbP8pj42bKaUSrrfDUsicfeJf6
 m1iJRu0SXYVlMruGUB1PvZQ3O7TsVfAGCv85pFipdgk8KQnlRFkYhUjLft0u7CL1rDGZWDDr
 NaNj54q2CX9zuSxBn9XDXvGKyzKEZ4NY1Jfw+TAMPCp4buawuOsjONi2X0DfivFY+ZsjAIcx
 qQMglPtKk/wBs7q2lvJ+pHpgvLhLZyGqzAvKM1sVtRJ5j+ARKA0w4pYs5a5ufqcfT7dN6TBk
 LXZeD9xlVic93Ju08JSUx2ozlcfxq+BVNyA+dtv7elXUZ2DrYwARAQABzStHdXN0YXZvIEEu
 IFIuIFNpbHZhIDxndXN0YXZvYXJzQGtlcm5lbC5vcmc+wsGrBBMBCAA+FiEEkmRahXBSurMI
 g1YvRwW0y0cG2zEFAl6zFvQCGyMFCQlmAYAFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AAIQkQ
 RwW0y0cG2zEWIQSSZFqFcFK6swiDVi9HBbTLRwbbMZsEEACWjJyXLjtTAF21Vuf1VDoGzitP
 oE69rq9UhXIGR+e0KACyIFoB9ibG/1j/ESMa0RPSwLpJDLgfvi/I18H/9cKtdo2uz0XNbDT8
 i3llIu0b43nzGIDzRudINBXC8Coeob+hrp/MMZueyzt0CUoAnY4XqpHQbQsTfTrpFeHT02Qz
 ITw6kTSmK7dNbJj2naH2vSrU11qGdU7aFzI7jnVvGgv4NVQLPxm/t4jTG1o+P1Xk4N6vKafP
 zqzkxj99JrUAPt+LyPS2VpNvmbSNq85PkQ9gpeTHpkio/D9SKsMW62njITPgy6M8TFAmx8JF
 ZAI6k8l1eU29F274WnlQ6ZokkJoNctwHa+88euWKHWUDolCmQpegJJ8932www83GLn1mdUZn
 NsymjFSdMWE+y8apWaV9QsDOKWf7pY2uBuE6GMPRhX7e7h5oQwa1lYeO2L9LTDeXkEOJe+hE
 qQdEEvkC/nok0eoRlBlZh433DQlv4+IvSsfN/uWld2TuQFyjDCLIm1CPRfe7z0TwiCM27F+O
 lHnUspCFSgpnrxqNH6CM4aj1EF4fEX+ZyknTSrKL9BGZ/qRz7Xe9ikU2/7M1ov6rOXCI4NR9
 THsNax6etxCBMzZs2bdMHMcajP5XdRsOIARuN08ytRjDolR2r8SkTN2YMwxodxNWWDC3V8X2
 RHZ4UwQw487BTQRbLBwMARAAsHCE31Ffrm6uig1BQplxMV8WnRBiZqbbsVJBH1AAh8tq2ULl
 7udfQo1bsPLGGQboJSVN9rckQQNahvHAIK8ZGfU4Qj8+CER+fYPp/MDZj+t0DbnWSOrG7z9H
 IZo6PR9z4JZza3Hn/35jFggaqBtuydHwwBANZ7A6DVY+W0COEU4of7CAahQo5NwYiwS0lGis
 LTqks5R0Vh+QpvDVfuaF6I8LUgQR/cSgLkR//V1uCEQYzhsoiJ3zc1HSRyOPotJTApqGBq80
 X0aCVj1LOiOF4rrdvQnj6iIlXQssdb+WhSYHeuJj1wD0ZlC7ds5zovXh+FfFl5qH5RFY/qVn
 3mNIVxeO987WSF0jh+T5ZlvUNdhedGndRmwFTxq2Li6GNMaolgnpO/CPcFpDjKxY/HBUSmaE
 9rNdAa1fCd4RsKLlhXda+IWpJZMHlmIKY8dlUybP+2qDzP2lY7kdFgPZRU+ezS/pzC/YTzAv
 CWM3tDgwoSl17vnZCr8wn2/1rKkcLvTDgiJLPCevqpTb6KFtZosQ02EGMuHQI6Zk91jbx96n
 rdsSdBLGH3hbvLvjZm3C+fNlVb9uvWbdznObqcJxSH3SGOZ7kCHuVmXUcqozol6ioMHMb+In
 rHPP16aVDTBTPEGwgxXI38f7SUEn+NpbizWdLNz2hc907DvoPm6HEGCanpcAEQEAAcLBZQQY
 AQgADwUCWywcDAIbDAUJCWYBgAAKCRBHBbTLRwbbMdsZEACUjmsJx2CAY+QSUMebQRFjKavw
 XB/xE7fTt2ahuhHT8qQ/lWuRQedg4baInw9nhoPE+VenOzhGeGlsJ0Ys52sdXvUjUocKgUQq
 6ekOHbcw919nO5L9J2ejMf/VC/quN3r3xijgRtmuuwZjmmi8ct24TpGeoBK4WrZGh/1hAYw4
 ieARvKvgjXRstcEqM5thUNkOOIheud/VpY+48QcccPKbngy//zNJWKbRbeVnimua0OpqRXhC
 rEVm/xomeOvl1WK1BVO7z8DjSdEBGzbV76sPDJb/fw+y+VWrkEiddD/9CSfgfBNOb1p1jVnT
 2mFgGneIWbU0zdDGhleI9UoQTr0e0b/7TU+Jo6TqwosP9nbk5hXw6uR5k5PF8ieyHVq3qatJ
 9K1jPkBr8YWtI5uNwJJjTKIA1jHlj8McROroxMdI6qZ/wZ1ImuylpJuJwCDCORYf5kW61fcr
 HEDlIvGc371OOvw6ejF8ksX5+L2zwh43l/pKkSVGFpxtMV6d6J3eqwTafL86YJWH93PN+ZUh
 6i6Rd2U/i8jH5WvzR57UeWxE4P8bQc0hNGrUsHQH6bpHV2lbuhDdqo+cM9ehGZEO3+gCDFmK
 rjspZjkJbB5Gadzvts5fcWGOXEvuT8uQSvl+vEL0g6vczsyPBtqoBLa9SNrSVtSixD1uOgyt
 AP7RWS474w==
Subject: Re: [PATCH v3] gpio: omap: handle pin config bias flags
Message-ID: <f27995fd-5885-9dbf-c42e-73dbe69fcfab@embeddedor.com>
Date:   Mon, 20 Jul 2020 17:38:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200717194043.1774643-1-drew@beagleboard.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 200.68.140.17
X-Source-L: No
X-Exim-ID: 1jxeLR-003Y1j-5s
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.43.132]) [200.68.140.17]:18421
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 7
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Drew,

Somehow I ran into this patch in Linus' tree:

https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?h=for-next&id=75dec56710dfafd37daa95e756c5d1840932ba90

Please, see some comments below...

On 7/17/20 14:40, Drew Fustini wrote:
> Modify omap_gpio_set_config() to handle pin config bias flags by calling
> gpiochip_generic_config().
> 
> The pin group for the gpio line must have the corresponding pinconf
> properties:
> 
> PIN_CONFIG_BIAS_PULL_UP requires "pinctrl-single,bias-pullup"
> PIN_CONFIG_BIAS_PULL_DOWN requires "pinctrl-single,bias-pulldown"
> 
> This is necessary for pcs_pinconf_set() to find the requested bias
> parameter in the PIN_MAP_TYPE_CONFIGS_GROUP pinctrl map.
> 
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>
> Acked-by: Tony Lindgren <tony@atomide.com>
> Link: https://lore.kernel.org/r/20200715213738.1640030-1-drew@beagleboard.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-omap.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> v3 changes:
> - adjust the braces to match the correct coding style
> - note: I originally re-submitted this as v2 by accident when it should
>   have been v3. Sorry for the noise.
> 
> v2 changes:
> - simplify handling of -ENOTSUPP return value per Grygorii's suggestion
> 
> diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
> index b8e2ecc3eade..0ccb31de0b67 100644
> --- a/drivers/gpio/gpio-omap.c
> +++ b/drivers/gpio/gpio-omap.c
> @@ -896,12 +896,18 @@ static int omap_gpio_set_config(struct gpio_chip *chip, unsigned offset,
>  				unsigned long config)
>  {
>  	u32 debounce;
> +	int ret = -ENOTSUPP;
> +
> +	if ((pinconf_to_config_param(config) == PIN_CONFIG_BIAS_DISABLE) ||
> +	    (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_UP) ||
> +	    (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_DOWN)) {
> +		ret = gpiochip_generic_config(chip, offset, config);
> +	} else if (pinconf_to_config_param(config) == PIN_CONFIG_INPUT_DEBOUNCE) {
> +		debounce = pinconf_to_config_argument(config);
> +		ret = omap_gpio_debounce(chip, offset, debounce);
> +	}
>  
> -	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
> -		return -ENOTSUPP;
> -
> -	debounce = pinconf_to_config_argument(config);
> -	return omap_gpio_debounce(chip, offset, debounce);
> +	return ret;
>  }
>  
>  static void omap_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
> 

Maybe next time you could consider coding something like this, instead:

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 8dd86b9fae53..7fbe0c9e1fc1 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -899,16 +899,18 @@ static int omap_gpio_set_config(struct gpio_chip *chip, unsigned offset,
        u32 debounce;
        int ret = -ENOTSUPP;

-       if ((pinconf_to_config_param(config) == PIN_CONFIG_BIAS_DISABLE) ||
-           (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_UP) ||
-           (pinconf_to_config_param(config) == PIN_CONFIG_BIAS_PULL_DOWN))
-       {
+       switch (pinconf_to_config_param(config)) {
+       case PIN_CONFIG_BIAS_DISABLE:
+       case PIN_CONFIG_BIAS_PULL_UP:
+       case PIN_CONFIG_BIAS_PULL_DOWN:
                ret = gpiochip_generic_config(chip, offset, config);
-       }
-       else if (pinconf_to_config_param(config) == PIN_CONFIG_INPUT_DEBOUNCE)
-       {
+               break;
+       case PIN_CONFIG_INPUT_DEBOUNCE:
                debounce = pinconf_to_config_argument(config);
                ret = omap_gpio_debounce(chip, offset, debounce);
+               break;
+       default:
+               break;
        }

        return ret;

It looks a bit more readable and cleaner. :)

Thanks
--
Gustavo
