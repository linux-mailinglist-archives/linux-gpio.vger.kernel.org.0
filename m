Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EADD664213B
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Dec 2022 02:51:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbiLEBvc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Dec 2022 20:51:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbiLEBvb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Dec 2022 20:51:31 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AB36311146
        for <linux-gpio@vger.kernel.org>; Sun,  4 Dec 2022 17:51:28 -0800 (PST)
Received: from loongson.cn (unknown [117.133.84.183])
        by gateway (Coremail) with SMTP id _____8Dx9vCfTo1j8SwDAA--.7352S3;
        Mon, 05 Dec 2022 09:51:27 +0800 (CST)
Received: from [192.168.1.2] (unknown [117.133.84.183])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8CxXuCcTo1jvrAlAA--.26746S3;
        Mon, 05 Dec 2022 09:51:25 +0800 (CST)
Message-ID: <e9ef114c-55fe-0a6b-398c-51b94b215559@loongson.cn>
Date:   Mon, 5 Dec 2022 09:51:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [brgl:gpio/for-next 63/65]
 drivers/gpio/gpio-loongson-64bit.c:263:15: error: no member named 'of_node'
 in 'struct gpio_chip'; did you mean 'fwnode'?
To:     kernel test robot <lkp@intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Hongchen Zhang <zhanghongchen@loongson.cn>,
        Liu Peibao <liupeibao@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>,
        Linus Walleij <linus.walleij@linaro.org>
References: <202212040126.HnyXYYfY-lkp@intel.com>
From:   Yinbo Zhu <zhuyinbo@loongson.cn>
In-Reply-To: <202212040126.HnyXYYfY-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxXuCcTo1jvrAlAA--.26746S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Ww1fGryrXFWkGry5Zr1rCrg_yoWxZr4Upa
        1Uu340qws5Xr1UJwsYkanxArWYyw45G3yakFy0g34093W7tr98tr1DuFZIgr1q9r4q9a4j
        gr4xGay2ga4UAaUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bxkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
        kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28E
        F7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487
        Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l42xK82IY6x
        8ErcxFaVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
        x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
        CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
        42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z2
        80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8c_-PUUUUU==
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,


My loongson-2 configure file is enable CONFIG_OF_GPIO by default, so 
there is no

compilation error, and I will add select OF_GPIO for GPIO_LOONGSON_64BIT.


About the warning that happen on arch/hexagon/,  It should be related to 
architecture

file.  My patch was base on LoongArch architecture and compile it no any 
warning that

use W=1.


Thanks,

Yinbo

在 2022/12/4 1:20, kernel test robot 写道:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
> head:   96010045bb9eb70dcb67937e4e6ac182bdb2b1be
> commit: d9cfe5825bb342548a5abd57ad37c7523b9ef446 [63/65] gpio: loongson: add gpio driver support
> config: hexagon-buildonly-randconfig-r002-20221203
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 6e4cea55f0d1104408b26ac574566a0e4de48036)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?id=d9cfe5825bb342548a5abd57ad37c7523b9ef446
>          git remote add brgl https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
>          git fetch --no-tags brgl gpio/for-next
>          git checkout d9cfe5825bb342548a5abd57ad37c7523b9ef446
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpio/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>     In file included from drivers/gpio/gpio-loongson-64bit.c:14:
>     In file included from include/linux/gpio/driver.h:6:
>     In file included from include/linux/irq.h:20:
>     In file included from include/linux/io.h:13:
>     In file included from arch/hexagon/include/asm/io.h:334:
>     include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>             val = __raw_readb(PCI_IOBASE + addr);
>                               ~~~~~~~~~~ ^
>     include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>             val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
>                                                             ~~~~~~~~~~ ^
>     include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
>     #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>                                                       ^
>     In file included from drivers/gpio/gpio-loongson-64bit.c:14:
>     In file included from include/linux/gpio/driver.h:6:
>     In file included from include/linux/irq.h:20:
>     In file included from include/linux/io.h:13:
>     In file included from arch/hexagon/include/asm/io.h:334:
>     include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>             val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
>                                                             ~~~~~~~~~~ ^
>     include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
>     #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>                                                       ^
>     In file included from drivers/gpio/gpio-loongson-64bit.c:14:
>     In file included from include/linux/gpio/driver.h:6:
>     In file included from include/linux/irq.h:20:
>     In file included from include/linux/io.h:13:
>     In file included from arch/hexagon/include/asm/io.h:334:
>     include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>             __raw_writeb(value, PCI_IOBASE + addr);
>                                 ~~~~~~~~~~ ^
>     include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>             __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
>                                                           ~~~~~~~~~~ ^
>     include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>             __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
>                                                           ~~~~~~~~~~ ^
>>> drivers/gpio/gpio-loongson-64bit.c:263:15: error: no member named 'of_node' in 'struct gpio_chip'; did you mean 'fwnode'?
>                     lgpio->chip.of_node = np;
>                                 ^~~~~~~
>                                 fwnode
>     include/linux/gpio/driver.h:411:24: note: 'fwnode' declared here
>             struct fwnode_handle    *fwnode;
>                                      ^
>     6 warnings and 1 error generated.
>
>
> vim +263 drivers/gpio/gpio-loongson-64bit.c
>
>     234	
>     235	static int loongson_gpio_init(
>     236				struct device *dev, struct loongson_gpio_chip *lgpio,
>     237				struct device_node *np, void __iomem *reg_base)
>     238	{
>     239		int ret;
>     240		u32 ngpios;
>     241		struct irq_domain *parent;
>     242		struct gpio_irq_chip *girq;
>     243		struct device_node *irq_parent;
>     244	
>     245		lgpio->reg_base = reg_base;
>     246	
>     247		if (lgpio->chip_data->mode == BIT_CTRL_MODE) {
>     248			ret = bgpio_init(&lgpio->chip, dev, 8,
>     249					LOONGSON_GPIO_IN(lgpio),
>     250					LOONGSON_GPIO_OUT(lgpio), 0,
>     251					LOONGSON_GPIO_OEN(lgpio), NULL, 0);
>     252			if (ret) {
>     253				dev_err(dev, "unable to init generic GPIO\n");
>     254				return ret;
>     255			}
>     256		} else {
>     257			lgpio->chip.direction_input = loongson_gpio_direction_input;
>     258			lgpio->chip.get = loongson_gpio_get;
>     259			lgpio->chip.get_direction = loongson_gpio_get_direction;
>     260			lgpio->chip.direction_output = loongson_gpio_direction_output;
>     261			lgpio->chip.set = loongson_gpio_set;
>     262			lgpio->chip.can_sleep = 0;
>   > 263			lgpio->chip.of_node = np;
>     264			lgpio->chip.parent = dev;
>     265			spin_lock_init(&lgpio->lock);
>     266		}
>     267	
>     268		device_property_read_u32(dev, "ngpios", &ngpios);
>     269	
>     270		lgpio->chip.ngpio = ngpios;
>     271		lgpio->chip.label = lgpio->chip_data->label;
>     272	
>     273		if (lgpio->chip_data->support_irq == true) {
>     274			lgpio->chip.to_irq = loongson_gpio_to_irq;
>     275			irq_parent = of_irq_find_parent(np);
>     276			if (irq_parent)
>     277				parent = irq_find_host(irq_parent);
>     278	
>     279			lgpio->fwnode = of_node_to_fwnode(np);
>     280	
>     281			girq = &lgpio->chip.irq;
>     282			gpio_irq_chip_set_chip(girq, &loongson_gpio_irqchip);
>     283			girq->fwnode = lgpio->fwnode;
>     284			girq->parent_domain = parent;
>     285			girq->child_to_parent_hwirq = loongson_gpio_child_to_parent_hwirq;
>     286			girq->handler = handle_bad_irq;
>     287			girq->default_type = IRQ_TYPE_NONE;
>     288		}
>     289	
>     290		return devm_gpiochip_add_data(dev, &lgpio->chip, lgpio);
>     291	}
>     292	
>

