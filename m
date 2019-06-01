Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2926F318D2
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2019 02:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbfFAAoy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 May 2019 20:44:54 -0400
Received: from mga14.intel.com ([192.55.52.115]:41141 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726610AbfFAAoy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 31 May 2019 20:44:54 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 May 2019 17:44:53 -0700
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 31 May 2019 17:44:51 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hWs8g-000EPf-Q8; Sat, 01 Jun 2019 08:44:50 +0800
Date:   Sat, 1 Jun 2019 08:44:05 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     kbuild-all@01.org, linux-gpio@vger.kernel.org
Subject: [gpio:gpio-descriptors-spi 1/6] drivers/gpio/gpiolib-of.c:285:38:
 error: passing argument 4 of 'of_find_gpio' from incompatible pointer type
Message-ID: <201906010803.coUc4Pxo%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git gpio-descriptors-spi
head:   22b4cce644e2a37043b522197f7941eff3c6561c
commit: d1bec4f1f9f8106c2f445c1ea6c7c2a1ba104635 [1/6] gpio: of: Handle the Freescale SPI CS
config: openrisc-or1ksim_defconfig (attached as .config)
compiler: or1k-linux-gcc (GCC) 7.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout d1bec4f1f9f8106c2f445c1ea6c7c2a1ba104635
        # save the attached .config to linux build tree
        GCC_VERSION=7.3.0 make.cross ARCH=openrisc 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpio/gpiolib-of.c: In function 'of_find_spi_cs_gpio':
>> drivers/gpio/gpiolib-of.c:285:38: error: passing argument 4 of 'of_find_gpio' from incompatible pointer type [-Werror=incompatible-pointer-types]
     return of_find_gpio(dev, NULL, idx, flags);
                                         ^~~~~
   In file included from drivers/gpio/gpiolib-of.c:23:0:
   drivers/gpio/gpiolib.h:96:19: note: expected 'long unsigned int *' but argument is of type 'enum gpio_lookup_flags *'
    struct gpio_desc *of_find_gpio(struct device *dev,
                      ^~~~~~~~~~~~
   drivers/gpio/gpiolib-of.c: In function 'of_find_gpio':
>> drivers/gpio/gpiolib-of.c:361:48: error: passing argument 4 of 'of_find_spi_cs_gpio' from incompatible pointer type [-Werror=incompatible-pointer-types]
      desc = of_find_spi_cs_gpio(dev, con_id, idx, flags);
                                                   ^~~~~
   drivers/gpio/gpiolib-of.c:262:26: note: expected 'enum gpio_lookup_flags *' but argument is of type 'long unsigned int *'
    static struct gpio_desc *of_find_spi_cs_gpio(struct device *dev,
                             ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +/of_find_gpio +285 drivers/gpio/gpiolib-of.c

   256	
   257	/*
   258	 * The old Freescale bindings use simply "gpios" as name for the chip select
   259	 * lines rather than "cs-gpios" like all other SPI hardware. Account for this
   260	 * with a special quirk.
   261	 */
   262	static struct gpio_desc *of_find_spi_cs_gpio(struct device *dev,
   263						     const char *con_id,
   264						     unsigned int idx,
   265						     enum gpio_lookup_flags *flags)
   266	{
   267		struct device_node *np = dev->of_node;
   268	
   269		if (!IS_ENABLED(CONFIG_SPI_MASTER))
   270			return ERR_PTR(-ENOENT);
   271	
   272		/* Allow this specifically for Freescale devices */
   273		if (!of_device_is_compatible(np, "fsl,spi") &&
   274		    !of_device_is_compatible(np, "aeroflexgaisler,spictrl"))
   275			return ERR_PTR(-ENOENT);
   276		/* Allow only if asking for "cs-gpios" */
   277		if (!con_id || strcmp(con_id, "cs"))
   278			return ERR_PTR(-ENOENT);
   279	
   280		/*
   281		 * While all other SPI controllers use "cs-gpios" the Freescale
   282		 * uses just "gpios" so translate to that when "cs-gpios" is
   283		 * requested.
   284		 */
 > 285		return of_find_gpio(dev, NULL, idx, flags);
   286	}
   287	
   288	/*
   289	 * Some regulator bindings happened before we managed to establish that GPIO
   290	 * properties should be named "foo-gpios" so we have this special kludge for
   291	 * them.
   292	 */
   293	static struct gpio_desc *of_find_regulator_gpio(struct device *dev, const char *con_id,
   294							enum of_gpio_flags *of_flags)
   295	{
   296		/* These are the connection IDs we accept as legacy GPIO phandles */
   297		const char *whitelist[] = {
   298			"wlf,ldoena", /* Arizona */
   299			"wlf,ldo1ena", /* WM8994 */
   300			"wlf,ldo2ena", /* WM8994 */
   301		};
   302		struct device_node *np = dev->of_node;
   303		struct gpio_desc *desc;
   304		int i;
   305	
   306		if (!IS_ENABLED(CONFIG_REGULATOR))
   307			return ERR_PTR(-ENOENT);
   308	
   309		if (!con_id)
   310			return ERR_PTR(-ENOENT);
   311	
   312		i = match_string(whitelist, ARRAY_SIZE(whitelist), con_id);
   313		if (i < 0)
   314			return ERR_PTR(-ENOENT);
   315	
   316		desc = of_get_named_gpiod_flags(np, con_id, 0, of_flags);
   317		return desc;
   318	}
   319	
   320	struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
   321				       unsigned int idx, unsigned long *flags)
   322	{
   323		char prop_name[32]; /* 32 is max size of property name */
   324		enum of_gpio_flags of_flags;
   325		struct gpio_desc *desc;
   326		unsigned int i;
   327	
   328		/* Try GPIO property "foo-gpios" and "foo-gpio" */
   329		for (i = 0; i < ARRAY_SIZE(gpio_suffixes); i++) {
   330			if (con_id)
   331				snprintf(prop_name, sizeof(prop_name), "%s-%s", con_id,
   332					 gpio_suffixes[i]);
   333			else
   334				snprintf(prop_name, sizeof(prop_name), "%s",
   335					 gpio_suffixes[i]);
   336	
   337			desc = of_get_named_gpiod_flags(dev->of_node, prop_name, idx,
   338							&of_flags);
   339			/*
   340			 * -EPROBE_DEFER in our case means that we found a
   341			 * valid GPIO property, but no controller has been
   342			 * registered so far.
   343			 *
   344			 * This means we don't need to look any further for
   345			 * alternate name conventions, and we should really
   346			 * preserve the return code for our user to be able to
   347			 * retry probing later.
   348			 */
   349			if (IS_ERR(desc) && PTR_ERR(desc) == -EPROBE_DEFER)
   350				return desc;
   351	
   352			if (!IS_ERR(desc) || (PTR_ERR(desc) != -ENOENT))
   353				break;
   354		}
   355	
   356		/* Special handling for SPI GPIOs if used */
   357		if (IS_ERR(desc))
   358			desc = of_find_spi_gpio(dev, con_id, &of_flags);
   359		if (IS_ERR(desc)) {
   360			/* This quirk looks up flags and all */
 > 361			desc = of_find_spi_cs_gpio(dev, con_id, idx, flags);
   362			if (!IS_ERR(desc))
   363				return desc;
   364		}
   365	
   366		/* Special handling for regulator GPIOs if used */
   367		if (IS_ERR(desc) && PTR_ERR(desc) != -EPROBE_DEFER)
   368			desc = of_find_regulator_gpio(dev, con_id, &of_flags);
   369	
   370		if (IS_ERR(desc))
   371			return desc;
   372	
   373		if (of_flags & OF_GPIO_ACTIVE_LOW)
   374			*flags |= GPIO_ACTIVE_LOW;
   375	
   376		if (of_flags & OF_GPIO_SINGLE_ENDED) {
   377			if (of_flags & OF_GPIO_OPEN_DRAIN)
   378				*flags |= GPIO_OPEN_DRAIN;
   379			else
   380				*flags |= GPIO_OPEN_SOURCE;
   381		}
   382	
   383		if (of_flags & OF_GPIO_TRANSITORY)
   384			*flags |= GPIO_TRANSITORY;
   385	
   386		if (of_flags & OF_GPIO_PULL_UP)
   387			*flags |= GPIO_PULL_UP;
   388		if (of_flags & OF_GPIO_PULL_DOWN)
   389			*flags |= GPIO_PULL_DOWN;
   390	
   391		return desc;
   392	}
   393	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--GvXjxJ+pjyke8COw
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICFPJ8VwAAy5jb25maWcAlDzbbtu6su/7K4QuYKPFRrvsXNr0HPSBpiiLy6KkiJQvfRFc
R0mNJnaO7azV/v0ZUpJNSUOnG9iXmjMcDsm5c5Q//vWHR14O26flYb1aPj7+8h7KTblbHso7
7379WP6v5ydenCiP+Vx9AORovXn5+ef2udzs1vuVd/3h4sPg/W419CblblM+enS7uV8/vACF
9Xbzrz/+Bf/5AwafnoHY7n+87W744/2jpvH+YbXy3o4pfed9+nD5YQCINIkDPi4oLbgsAPLl
VzMEP4opyyRP4i+fBpeDwRE3IvH4CBpYJEIiCyJFMU5UciJUA2YkiwtBFiNW5DGPueIk4l+Z
f0Lk2W0xS7IJjJgtjM2xPHr78vDyfOJ1lCUTFhdJXEiRWrOBZMHiaUGycRFxwdWXywt9EDUX
iUh5xArFpPLWe2+zPWjCzewooSRq9vTmDTZckNze1ijnkV9IEikL32cBySNVhIlUMRHsy5u3
m+2mfPfmxIhcyClPqc3DEZYmks8LcZuznCFM0iyRshBMJNmiIEoRGgI/x9m5ZBEfoYRJDrJk
Q8wBw4F7+5dv+1/7Q/l0OuAxi1nGqbmPNEtGzBIKCyTDZIZDaMjT9rX6iSA8Po2FJPbhMqph
jXECyZRkktVjf3jl5s7b3ndYxRYVcO68Jpz1+aJwlRM2ZbGSZ4FavIhPiVSNGKr1U7nbYwel
OJ2AHDI4CXUiGidF+FXLm0hi+3pgMIXVEp9T5G6rWRyY71BqkeDjsMiYhJUFCGX7quuT6rHb
UEszxkSqgGrMbKLN+DSJ8liRbIGLZoXVkyGa5n+q5f6Hd4B1vSXwsD8sD3tvuVptXzaH9eah
c14woSCUJrAWj8c2IyPpa3mjDIQcMBTKhyJyIhVREudScvRQfoNLs5uM5p7ELjpeFACzuYWf
BZvDjWLmRFbI9nTZzK9Zai91ossn1T/Q/fFJyIgPV28OCrVj2jIFoJw8UF+GV6fL57GagLkK
WBfn0jKS4yzJU/xotTkD3YTbQcE0ZHSSJrCKFlCVZAxFk4DnG0tqlsJxFjKQYEpB5ChRzEeR
MhaRBXIAo2gCU6fGHWR+2z1kRABhmeQZZdpon4j5xfgrTxFyABkB5OJECEair4K0BuZfO/Ck
8/uq5Q6TFPQXfF8RJJm2CfB/gsS0pZVdNAn/wARtIamKbMM6Bf/K/eFHy1OlwelHJbKn3x1c
Y0XBkWQ2L3LMlAC9M6uRKML50EdbwVtzDYNnZgaVyT6xUDnBysJZo0aAbfc7tjYVBWBwM4vI
iIAPCfLIOpogV2ze+Vmk3GaWpQm+Oz6OSRT4Nq5hMMCF07iSNqyhFIL7tskQniBoPCnyrDKP
DZ4/5bCl+hytgwF6I5JlvH1lE420ELiugkBgF2IHEpmJY1zbEyPm+w7FTOlwcNVzE3Wompa7
++3uablZlR77u9yACSZgDqk2wuC1DGptH39zxmnhqajOvTC+pecerTiQKPDyE9z2RASPoGSU
j7D7jJKRFbvAbLiQbMyaSLClCmEeBBD1pATgcPYQW4KddHjbJOARCADqzdqBcbN4krI449IK
4bWrHen7in1OrOhLCMs5NTFQOGMQXbTjGJ6kSaYgarfCObCi1IRnQUTGoPJ5qnGQmErmwjoZ
CFYn1dTeDB18gbW3AEYO0t12Ve732513+PVcOe37cnl42ZX7k2dOsuGkGF4MBvZBQ/gGbqaY
ZVwxFYKfGYfI1TXnZSJ5cNGFr0Zf3uhsab9+elNHN4/L/d7j3OOb/WH3stIZlr16Q8KYXR5L
VQTB8LQzDB6dh4MBPgv3+dSOInAGLZkTmFeDSHPYPjIYubgeoLIIIMj+XCCgM0BX+DI8pYzH
fYBMyRScWVb4cm6v396pDImfzIpx2lbiRqyFD6phPLi5JL/89vLwADGct33uXNBfuUiLPIXk
LY8rP+ODB6QMPGs7OD+uz4C3I4b2MlVkg+ohsnADOie8reR2uVt9Xx/KlQa9vyshyb8DI9ff
iTkXktGwUsAwSSZ9nYPbNilEAVIPcaLlPfTEy4sRpMhJEBSW8tXZudFPsDqKUbBJTY7Q2IvE
zyPIOsAvGFerYy/LM48VGcGaEVhfcEwXzfjHK72cdpPWapX1rTipQVZIFxjTbfx2z4OMaTJ9
/225L++8H5VreN5t79ePVYZxso1n0I4cR/kY9F0n6ZR+efPwn/+86RvXVy7mGN5plYVIglku
2QQfUuhIaNA5Q3u/1ZCO7qgOygnuT2usPD6HUZcocJdXU4AE5FjJcDj+BtORfdRgfYkQ4+OL
qYwLYBZExS8m7ghE23ws7om1ZoON4LHZMeSLreJADdfCXcPPwdC5xiu4JtvA9myjQVoBTHHG
NyxqLOlGyWYNghFQ9rNcvRyW3x5LU+bzTFhzsFR8xONAKK1hrci2HdjqX4WvzVpTa9IaWWeF
lghWtCTNeNoKQmqAAFuHmVagronbLsbFt9mUKJ+2u1+eWG6WD+UTarkgTlBV0GsNgIXxmY5d
28GFTCMwDKky5w/hi/xy1TIdtLbbjUDycUa6pnwiBbKz5rQErAfzQAd8P/tyNfj88RjvMLgz
SI5M2DRpBek0YpCf6aACjykFQce/pkmCK9rXUY7r8ldjNhK8PGhMu4ketQ+Y9MLDxryxTG/B
XSUZ52kxYjENBemGwfWdu6/1dFrHQC0uD/9sdz9QBwxXNmEtAaxGII4hY+Sa8phbOZr+BTLc
ugsz1p19Mj8RvuV5kAmT1+C1DWBowrByAo/b3PO0SpF1gRC/o1SnajqbBwOQgGfAVwS0NMbL
H5oZnvJzwLG2AUzkc0f9JAZtSSbcUaqpaEwVd0KDJMe51kASumFM4mzzak2tw264QyQUTWE7
8fh4rq0svAGOOK4zRwSav4oyY1LNkgTXzCNWCP96BUO+jrIYRbjROKJM2Zg4fGyDEk/Pw3WK
r2Oz81jRK7xCUp2cx1gwh1AcMXgE/jXhr+zHp68eHPUdin8UhFGGCFFj/jPYy8m+NKPN5C9v
duVm+6ZNVfjXroAItOijS4n0S1YhGe3b2A5OGi5MKAz2WqQumw7IAWSpDmsySs8AwdT41HGs
AJNU4bDMd9yW6/UK3Dw6Hl04Vhhl3B9jVU2T7BiTIImt7fUQSmwakbi4GVwMb1GwzyjMxvmL
6IVjQyTC725+cY2TIilePkrDxLU8Z4xpvq+vXDdfVc3xbVF8vRFcBtFBDm4hdLo7lTOuKK63
U6kfxBzhA3AEyjxxO2GROryw3kss8SVD6fbNFac+wzejMaJLCCQlqEBxDium7fchC5TNIdmX
i0JXgK0w+jbqRDneodwfmpzTmp9OFGThaDDVm9kB2IGTdR5EZMTnuOWlJMavHRcxAjn7PHOp
bVBMKK65Mw6pvivTm3FB8AAkCybckWHqo/qMWwNKeIADWBoWrpftOHA8pUuwpg7PZ4KRAIdF
M5XHMcO5DwiPkmnbztYlqL/Xq9Lzd+u/mzJ2wwelJPN7E0yVYb2qZ3jJMW4+xblVMTtkUcpw
jzZVIg2k7c2qEcjT89gq8YBjiX0S9Z99zQIBz8SMQEBpGhp6jAbr3dM/y13pPW6Xd+XO5jCY
mapF1+3Uwt2deMySIb2ZmSe6VrJ53IMuufkZnzq8WY3Appkjuq0QdJtHTQZ8voBLw32ZRiMQ
MNMG2TQ8IMd9LGtDZgWrc1rXcuyqUf8+zXGNXvbenRGQ1gOHPWwJewLSR13vAuPYoYxCYa9N
vrJeA5KgVfAMdCalHO0wANVZusoYswkUjGTRAgdNktFfrQGdYIPtaI21Sirwu8quTr8FGLzW
AFBg2RRyqc6zGYC0InbegK0kM9NPCT1pjqeCefLl+Xm7O9h30RqvChu61cq+teZIcyEWeh/o
upBUR4nMQZs029z1WC4zghvcdJqS2JGm0At0S4yByApvb22qYcZAis+XdP4RVdHO1Krbpfy5
3NevCU/muW3/HbT4zjvslpu9xvMe15vSu4PzWT/rf9pLKl508+KmLeW/p2sIk8dDuVt6QTom
3n1jUu62/2y0WfGetncvj6X3dlf+38t6V8ICF/Rd0wLHN4fy0RNwnP/2duWjabA7HVMHRWtj
pbwNTFLwR/3haZK2R09BU5LqGKJ3Q6dFwu3+0CF3AtLl7g5jwYm/fT4+MsgD7M4u17yliRTv
LId05N3iu+mtOnNOljTRMEFvtqUpNdsQZlUj1oE3sg9AXUm2rSc2wQrOTva2sXacW++UTDWP
/6c4KIl9VyplNBjX3tvc9CS6A1HFHIorCNUJiCtLdIGmcxdE+xuH0xo70ingAfJNF+/wL5m4
SgE5zgSMF1Nzvqbz0DF7yhQe0seRSOKeOpg476T1d20R9ddgIdbfXrQQyn/Wh9V3j1gvMRb6
6RnuN6cca+oqZFnL8+gtQjDkJxmEJ4TqR4B2ayXR2TUplMRCA3u2IF/tArUNAuGKFSc4MKP4
eJ4lWSsFrkaKeHRzgz68WpOrTsak5TdHV3iWOaJCSxyePsgFZFai6336C1IIBjttTCCTWNtE
a9KU250CNghW5HFr+2MmeMyPV4greAfQJ8y+1i2qJ9U3I0WcQvRMYgLL6Ni4eyJ9SmFOZoyj
3PObi+v5HAfFikUoRBCIdtodVGIqfLRJyJ7GacZasyby5uZ6WAi0n6kzM2k37HahEs4chcZE
uWFMZUmc2I+/NrTVdgUXOh+z/+7gby4/D6xnMhUmuAZpk657ce31bmGgYCCaePYqXl08A/4k
keiCma6cZCgIUlKZt3te5Xw8YkXHgCIzGbvFSSYRySAez/BzlgnlkPfNcVsnlbnfFj9KwLn8
BkOLOEnBLrRytxkt5tG4c679uVPeUmn4WWQhjx3OBaCgEbAPhb3PWGRn/GvnsaYaKWbXQ0f/
yhHhErWlWu/qZM+KPfQghHktFTVjVD98c5dYVThcjYgjLmkIFyKfF+PUUflpYQnBIfD5DXLm
zSqN2NwR2xjkkENkFjj1wuAISakOv7An1jRcRNzuhpvBSFM+gzke/GyivLt+pYQIX5PAa1S1
83Qj6J5RJ1DdDC7dYLi4T/P5WfjNp3Pw2s86ESgHz+jmvXZzTrgPHvIceT+9uby5uDgLV/Rm
ODxP4ermPPzjpy68hgZ8zszVtR5KaRqB8LkoGg9YzGdk4USJpPbzw8FwSN04c+WE1a70Vfhw
MHZsrPKq3Z0dPaab8hFDuc/86FqdGLFpbSDuHdyenZ4xHbVOzsCNE3PDwZGd3aYEY+AGKjYc
zB2PeRBLg93l1L34FEJwKZkTPtfdsWAmwaxcZPp/8XJK6vjCIGo/rxszpJPz9/v1XenlctSk
oQarLO/0t3mQZ2tIU84nd8vnQ7nDKi+zTlZXFWo2podmttZl87f92v8777AF7NI7fG+wECs5
c+SL5tkeKU+fNE76fZ745vnl0E/VLTVN837JKVzu7kwdhv+ZeHpKi0OpP3LCE1ciWDeLOGZx
GNFThQJhs1rz+3K3XOlrONXqGilTLbWdYjGdbib5DHZPtSOZiI0JXZhhXH5gi6CXMaTUprae
4Y9zcTGWeLmg7oTmseNpOAe7pNCAJ/J1l6r+gEbX3lvF/06JFEYmMNS7PVnu1stHS7bamzIl
XmonsTUA0pkBOmh9qmO+WYFTaYWUFmag7T7W+Gcj0apSga8VZ0VOMmU1htnQTH9VJtgRBWUC
wmGIGB0PqjYikanuCZtqaq8i+7NXUTJ1cXMzd+8+CYo0Ikp/DnR8ddxu3uu5gG1uzdgkRFFr
CprTCEyne412N6E1aB17l6rkAXfUohoMSmOHsa8x6grKX4qMXzvOGvU1tNoFQMb+KsEMj2hr
cCCjIkpfI0J1HgVBaOHzMYRjUfeFpilltrWrR0Y/fHWKxCeroBb1d06OOqI4fuCKIoSzAhyr
nzhsDoX/pjgMzjJa9NhqvjHo2djKd1xQ1GVcUJSKjW5hXzquJsU9uoQzwPfe/fLzGAL0C/Kp
Sr3V43b1A+MfgMXw+uam+ijY5cWrXMf09Tv7eCx3vry7W2snD5JhFt5/sAuYfX4sdnhMVYYV
cXSK2Mq36gEIA6RKiQrrr+Cvh8eWfDAwGqn/4OpMNzWg+rivdxJ1j+jT8vkZoiNDAYlXDIFP
V/MqWXWvUSm9G17XFt0I/szVe2PAgdL/NxjihQCD0jzxNjb4DGZ2/sDCaIZ7FwMVo5uP8hPe
OmEQKst25qwgUw66nTvtzl3sVqpbC/xqtPz5DNLbKaUj0C7zoBSO73ZnQ1wDkxnLCjJ1fLFt
oPqZF7e+FVx/GhbhmUA46zwynAxeyDJB8E6OGdENRQnWbyrlSH+DKvmo4wwlVskeUUFQ9FGn
K7w6/ZfHw/r+ZWO+0zpTC4F70O10kHwGEZtTh0U/YYUR9R1VG8ARukkD1y0NDvnHqwtIVPUL
IHrCCnSCSE4vnSQmTKSR4+sUzYD6ePn5kxMsxfUAlx0yml8PBiY+cc9eSOqQAA1WHPTl8vJ6
XigJRsR9SupWzG/wh/Kz12Zn1OM8cn7TKZjPSfORY08yxrvl8/f1ao+5JN9hi2C88NOCth/9
qmdzmIL0nNjDFR5Nvbfk5W699ej2+NHau97flDlR+K0JVevQbvlUet9e7u8hdPD7rRTBCD1s
dFrVSLNc/XhcP3w/eP/2QOCdT8wA03+lRsqmePtkpXYAwwx8o7WETiL9HWyXQA9eewub9gmY
ipvPV8NiFjmyDItMz5E07UGvbPbYedQVHMtiJXmMtQXlYOGSkHIIEJSKWO/7YA3vfaWrB80X
TvpzwZC2uvDztmk0l6XHsAdePZ5+/7XXf/vIi5a/dFjZN4BxkpoV55RxvJ9TQ41Hmrri1jMr
dcgQf+xwP2qROp7U9cQs0V/LudtoNU4epdwZ8eczPGQRwmGnmJD6r6g4SkCzAgQOX4lQ/XdV
+AhCC+UqyUJ2zkckdvzBDUUrncBNkfYx027DU/WiL8goD6xPg07yqfvuAt5tK2ie9dvzrK3k
c5/L1NX7lTsisynPmpZA7KtiDdbxDYvz9utUNdwJXusesdVuu9/eH7zw13O5ez/1Hl7KfTs/
PzbJnEe1DgUyZFfrSjhrPjvs8UJN/iC3L7sV2iSBwi3BIjwaJVhtgidC5N1v85t2RwP00uVD
WX0giLTWvYZa/d0diFoPpe5nwoyBbuBUrPsXb05/Sac/uSL6/LR/QOmlQjY3i1NszewYVN0U
3S+qAW9vpflbPl6ygZR5/fzO2z+Xq/X9sSv0aALJ0+P2AYbllmJXhYGreUBQ97g4pvWhldfc
bZd3q+2Tax4Kr4pP8/TPYFeWezCgpXe73fFbF5HXUA3u+oOYuwj0YFWNYZ5e/fzZm9OIJkAh
sbwVY0fJu4LHKW5gEOKG+v9XdmTLjeO49/mK1DzNVvV0dY7J9j7kgZZkW21d0REneVG5HW/i
6o6dsp3a7f36JUBJ5gHQmafEBMSbIIjz9n3xU84HO2EkXN8kQWv61uHH9+CDzg6lE2bdBQ3Z
VerjQeL0oa2nvahS4GrGZcSYsN7XLDuNkefoqWaIbjF3BdBgPLuUvXQZNwkxTVEkv9pO5JM8
FXIZy5vzQZABYT+KONCNCJ1qtd6B0yl7CePjE+R7tbzPOdnaOHWZbFBO6dHCji/lXpLAa5Tb
WZ4JYBB4vS0IlDqxh2TzP4DiqQdknLF836S3NrNmoBX3or34mqUgTmP8KnQs6D6LlYoCvZ7a
NEyvr20LjF70ZUyh9ewPBGPoyDg9lcLlPsTmabddPxmGBllY5nFI9qdH1zgbxskFTMbdvT2d
g2njEtR6lJSe8ZBT2nDbirJXjLlVatsS7KLJ/crIQ6s4Z7yGkzjlTgj0rwyUZwKJ0IVcovk4
0zem8yqRt4RadE0DdSeSOBR1JDvfYhRIzYwqugf+Y2xolvoyFU6izQuKrwP+EkMMGeG0UlDb
1RBH04JrEwjW/OUDKrSoeqssr+OxoWMMVRHFRSlIa4dWGwv3kwF42+Q1vbqg/xtXV+2YYfYR
zEHHEKOCgXVOFS0h7w0WyxfrAV8RMRF6flNhKzq5X70/bTF6hLPmwNW15rJi0cyW+ehAO+od
FmJghDTPYrmsTnXyWknCMqIWchaVme5GhdLu48/eyer4JEQfKxWlTgS0eFHh3IObDNGiJBzj
sA3KSO51I8wE/iEWrieW7jweTVUq9ZRStrpGh/NSZJOI3w8BxkWk6bgTyXF4ayqlh9lkD8S2
zN93F9bvS8MCFEvY6UQw4x4LYQfnzEUhgZT8Y4LadxWM9dgrDENm/ZStmt0ewrr2m6XJyiIw
xMRYovQq9HSDOyO3FDEHyEPBnnZ+aTPGEbfJYlkjfXIN2txZDCzfd+vDL+oNP4tYG4mgKeP6
oQ3TqEImq5YsEadiVbheIDNECHMiWS0grKkcksdfUvn6H/slNIvhpEpvfv+1eF18Ar+it/Xm
037x75X8fP30ab05rJ5h/L8bsQxfFrun1caMeqIrxtab9WG9+Ln+Xy9DHa6CuFbxto6heE3l
jf2lFRKRaPiofbZW6rfhjMuLLO+f78Hu19the7bc7lZn293Zy+rnG7oEGcitSCai0Ky7jeIL
txwijr0ShS7qKJkFcTGNShc0FdXUqQUKXdRSXtg2piwjEYd4jE4H2Z7MioIYJIQwcYuV6Xrp
1N6VXxhUXoHsYDTkh20YVxhcDfw0K6KWyfj84mvaUPrhDgNsiZx+QaE7CqDoGLuKaAj/0JLB
fmqaeio5Jh+K7W2quIP37z/Xyz9/rH6dLXFfPoNE+5dOZPp1ZEI/dOCQFsJ20Cg4BS+t0BLq
/fB+eFltIFI/uBdFG+wiaIH+sz68nIn9frtcIyhcHBZEnwPGtb5fPz84mEoGS1x8KfLk4fzy
Cx10Yjhqk7iSu+EjOPQ1qyNd/EVHNun3Z1421fUVrU3XcWRjXqQqujUF/PaqTIUkmHc3r50w
C8WYr9snkxPtp2vk3X6BrXGywDX99B/AHPvU9dRbeVLS9mEdOPd3rTgxsnt/3+QlPS8ZHqlf
dFAB1Q3xol3sX/gJp509erItobp+rO/sicHcWZV2foHPq/2B6kIZXNomRwTGCYT6/EvIhZ/o
TipcQt41+sAZTUOaix3A/q9jeRqipOUU9T2ZTMMTZAAwrr3HUmKcoAAS4/LCf7Sn4pzfHBIq
WyC2hwT8de5dL4lBmyL08NQPhtgFo5zhzrubalKe/8vbiXlh9VLtzfXbi2FVO9BU6vYWmMrB
eyyzZsREzeoxysC7p0ZJPh/H/q0biDRKkth7u0LEO+/uBATvjgm51AEKPMa/XjI2FY9MDNR+
aUVSCf+u7K9U/6XE6O0HeFlEmbevVepdlTryTrZ8XNtrprbX9vVtt9rve6MMe4IhMgcTo7K7
hh6ZgEIK/PXKu+eTR++gJHjqpUyPVe1GmCkXm6ft61n2/vp9tevC7x7oAYqsitugKDPKbquf
hHI0UVpcm+lFCN5J7klUMIvCuyhOnd8ghEoZgeqgeCCIGXD5rXwuOXWziFX3IPkQcskoim08
eIZ57uk5NSMQoSeQlNLdhKvdAXRLku3do1fMfv28wdjWZ8uX1fKHFZH5I+iIn6y/7xby+bvb
vh/WG5PfKNx4px1kFNcQyaisiDRFktJnQfHQjiEOSlNReYEAJYkyBgpeNU0dJybxzks6h8+g
9gliUJvrgW2HTEVdsTbbgZxmuYuYdQzOOZoatF6mRbZVNy3l9IL8kNWHywtJ1JIxEw6oQ0ji
IBo9fCU+VRCOOCCKKOc8bQKMUczOwTVbMwugrQ2TeOTlFwOabVJW9f45kpQVggx2sbE1ydLj
FVl+/wjF9u/2/uu1U4bKsMLFjcX1lVMoypQqq6dNOnIAkGzLrXcUfNPXuCtlxn0cm50pR4OY
GXM0gJ45x8DPmXJtwGCIJs+THloaikKjqVTA9+AgL8/tFEm1rl7u7NlUBDCJC6l2Bo/vYQYA
AmTUEep28GqSqIQeWsO3eoAHDJjlUgNR55KXx0U8thUyxgyQjY1OTyN39Tg0U43UkD2G3K4D
XXbIrSnc7Ok4lr7t1pvDD3R3eHpd7Z8pSXCXYgpcIGhdgoJD1hla8qX8jyA9FaYSGER2/2Qx
bps4qo+eYKncIqAEcmq4Oo6aHcnAX61/rv7ENGF4O+0RddllU6TGrTwo4mxMc1ZRhgK8tKlq
N5VEhzMuJQOOGRJvzr9cXJnrWGBORTaUPsS7xxYE42vYBeOXFYxyRh2ghjCm1Kd9vjHsuqFV
6rNTYeh8NtgS1lxFGLgdtFSpsIwl+5FaKCpfZJ4lD9ZxnYMPlpowTDdmhL03yl03F5VqYR6J
WR/onTwZH94Fx/pTAWYq1UNlBoYzWgdFox72RZWmKmWPrjkY8oqYHJDc2ei6WMWMfY6qEBD5
GPJYTT7PGAYTwXL+qvzEkuajbxEnEesWHVUcDZxID9YdY9qu5kalugSNCbU1IUqw1hborsdJ
PnfX3QBTpEclQZmJSmSDYfewTqoY67g5/81W1hwXy6pNfhTkd52rr6kj7Ho1tcIIKkEX1HeW
bJc/3t/UtpsuNs+m3Ww+xgwJDSSBqPlokQrYTptM5U0kkea3pDOMmeSG6I++ZzK59+XZzWkL
DAMORh5NdMyLooBwaeRNfSxWeQJxnox7DYr5xAbqK7XxoiykUvcYKwDNzqLIjrqtXiMgaD5m
+Plj/7beoOvep7PX98Pqvyv5z+qw/Pz58z80zwOwQ8G6J3j/Dlaz2i0o92Fvb0LzqFAHjNHT
8WPWGd8BJGyF7QN2spL5XCFBprM5eBV6cLHnPOlRSIrnkdXJeT9RF0whPok7NobuJ7Yqj0AN
YTddbqff5sM4vDzR31h0/Zbuk5vRTcNNJqdF3sQgWILEELyXbndVKPLqm5+YGWh3CZyAVz7a
jiZJMZdBT+EEpRwJhORJXEshSG1K3mGQMxXyXfLLBBgn1xKR2OnGxKy3FWWBoaVe1ci2veNv
Oz6hJDiEnqHvZqiNyhLjuX1T7AuJrOwO/Dggt8uChzqn0rXBWE1y0teMs2CSF0zTC48Flc+Y
e0tUmAcMPqfvDkVKPQjTOaTx8SB0jO+QYwExuaRRAGurTBSQS5mS8sgjI5k/lRcxInIYq3KR
yZXBQBTqA4a0DejyUHoRsWMqqy2TMMed9xAy03Kv5T5ABYBhSW13EwxIDWdXXvJMPAJEYaGj
Y55FSAzFn6ERaEF4OHLQ8q5u/WhdriEW3r9wGbKrD2ka3UM0cM+Y1aNWWfgw69XhVUFBGxMh
wkxi1IwZLCLgU5UWrCF8FNcpo07t4ZI6MA6xiNE0tgGyDr0XZcl4NyGcYmVNjBLkzTWf+wUn
nBNJIzQOmfw0uENnTIwJAN55UlipwYNYOsh9SzQq6Okfx5Ktg+SB/uOo9gFaiXq6Edo5pO19
hJZlrIUbIsknSiDpoHfbouyakW7K79ljge+srA1FLUDoXDaOLfKRXGO2A8bYb1QJyvAVyyUN
jCdZqsRirqWZkgL9H0qwN92zggAA

--GvXjxJ+pjyke8COw--
