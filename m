Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 911F36222D5
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 04:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbiKIDuk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 22:50:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbiKIDuX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 22:50:23 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 58EC41835F
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 19:50:09 -0800 (PST)
Received: from loongson.cn (unknown [10.180.13.64])
        by gateway (Coremail) with SMTP id _____8BxfdpvI2tjXXgFAA--.18063S3;
        Wed, 09 Nov 2022 11:50:07 +0800 (CST)
Received: from [10.180.13.64] (unknown [10.180.13.64])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxFldsI2tj81MPAA--.24155S2;
        Wed, 09 Nov 2022 11:50:04 +0800 (CST)
Subject: Re: [linusw-pinctrl:devel 21/30]
 drivers/pinctrl/pinctrl-loongson2.c:212:35: warning: excess elements in
 struct initializer
To:     kernel test robot <lkp@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        zhanghongchen <zhanghongchen@loongson.cn>
References: <202211090942.6OVKvIdY-lkp@intel.com>
From:   Yinbo Zhu <zhuyinbo@loongson.cn>
Message-ID: <e754dd19-a257-71d3-a5c3-18a6239d5c79@loongson.cn>
Date:   Wed, 9 Nov 2022 11:50:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <202211090942.6OVKvIdY-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxFldsI2tj81MPAA--.24155S2
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3ZrWDtw48Kw43trWDXFWfGrg_yoWDXw43pF
        W3Aw15GryUJr4DWry5J34UuFy3ua1xA342k3W7G3srXFZ8X3srWw1UKF4Uurs8Gr4jyF1a
        qr1DWFW5uF15ArDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bx8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
        kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28E
        F7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l
        57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCF04k20xvE74
        AGY7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
        Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07Uio7NUUUUU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



在 2022/11/9 上午9:12, kernel test robot 写道:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
> head:   a2a68e9e10bad391b01a9f4b0f3a81ce03afc2ad
> commit: 6c2a0a800390dd8f2b61d81a75ee7f62b049cb5e [21/30] pinctrl: pinctrl-loongson2: add pinctrl driver support
> config: m68k-allyesconfig
> compiler: m68k-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/?id=6c2a0a800390dd8f2b61d81a75ee7f62b049cb5e
>          git remote add linusw-pinctrl https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
>          git fetch --no-tags linusw-pinctrl devel
>          git checkout 6c2a0a800390dd8f2b61d81a75ee7f62b049cb5e
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/pinctrl/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>     drivers/pinctrl/pinctrl-loongson2.c:42:29: error: field 'desc' has incomplete type
>        42 |         struct pinctrl_desc desc;
>           |                             ^~~~
>     drivers/pinctrl/pinctrl-loongson2.c:63:38: error: array type has incomplete element type 'struct pinctrl_pin_desc'
>        63 | static const struct pinctrl_pin_desc loongson2_pctrl_pins[] = {
>           |                                      ^~~~~~~~~~~~~~~~~~~~
>     drivers/pinctrl/pinctrl-loongson2.c:62:26: error: implicit declaration of function 'PINCTRL_PIN' [-Werror=implicit-function-declaration]
>        62 | #define LOONGSON2_PIN(x) PINCTRL_PIN(x, "gpio"#x)
>           |                          ^~~~~~~~~~~
>     drivers/pinctrl/pinctrl-loongson2.c:64:9: note: in expansion of macro 'LOONGSON2_PIN'
>        64 |         LOONGSON2_PIN(0),  LOONGSON2_PIN(1),  LOONGSON2_PIN(2),  LOONGSON2_PIN(3),
>           |         ^~~~~~~~~~~~~
>     drivers/pinctrl/pinctrl-loongson2.c: In function 'loongson2_pin_dbg_show':
>     drivers/pinctrl/pinctrl-loongson2.c:208:9: error: implicit declaration of function 'seq_printf'; did you mean 'bstr_printf'? [-Werror=implicit-function-declaration]
>       208 |         seq_printf(s, " %s", dev_name(pcdev->dev));
>           |         ^~~~~~~~~~
>           |         bstr_printf
>     drivers/pinctrl/pinctrl-loongson2.c: At top level:
>     drivers/pinctrl/pinctrl-loongson2.c:211:21: error: variable 'loongson2_pctrl_ops' has initializer but incomplete type
>       211 | static const struct pinctrl_ops loongson2_pctrl_ops = {
>           |                     ^~~~~~~~~~~
>     drivers/pinctrl/pinctrl-loongson2.c:212:10: error: 'const struct pinctrl_ops' has no member named 'get_groups_count'
>       212 |         .get_groups_count       = loongson2_get_groups_count,
>           |          ^~~~~~~~~~~~~~~~
>>> drivers/pinctrl/pinctrl-loongson2.c:212:35: warning: excess elements in struct initializer
>       212 |         .get_groups_count       = loongson2_get_groups_count,
>           |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/pinctrl/pinctrl-loongson2.c:212:35: note: (near initialization for 'loongson2_pctrl_ops')
>     drivers/pinctrl/pinctrl-loongson2.c:213:10: error: 'const struct pinctrl_ops' has no member named 'get_group_name'
>       213 |         .get_group_name         = loongson2_get_group_name,
>           |          ^~~~~~~~~~~~~~
>     drivers/pinctrl/pinctrl-loongson2.c:213:35: warning: excess elements in struct initializer
>       213 |         .get_group_name         = loongson2_get_group_name,
>           |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/pinctrl/pinctrl-loongson2.c:213:35: note: (near initialization for 'loongson2_pctrl_ops')
>     drivers/pinctrl/pinctrl-loongson2.c:214:10: error: 'const struct pinctrl_ops' has no member named 'get_group_pins'
>       214 |         .get_group_pins         = loongson2_get_group_pins,
>           |          ^~~~~~~~~~~~~~
>     drivers/pinctrl/pinctrl-loongson2.c:214:35: warning: excess elements in struct initializer
>       214 |         .get_group_pins         = loongson2_get_group_pins,
>           |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/pinctrl/pinctrl-loongson2.c:214:35: note: (near initialization for 'loongson2_pctrl_ops')
>     drivers/pinctrl/pinctrl-loongson2.c:215:10: error: 'const struct pinctrl_ops' has no member named 'dt_node_to_map'
>       215 |         .dt_node_to_map         = pinconf_generic_dt_node_to_map_all,
>           |          ^~~~~~~~~~~~~~
>     drivers/pinctrl/pinctrl-loongson2.c:215:35: warning: excess elements in struct initializer
>       215 |         .dt_node_to_map         = pinconf_generic_dt_node_to_map_all,
>           |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/pinctrl/pinctrl-loongson2.c:215:35: note: (near initialization for 'loongson2_pctrl_ops')
>     drivers/pinctrl/pinctrl-loongson2.c:216:10: error: 'const struct pinctrl_ops' has no member named 'dt_free_map'
>       216 |         .dt_free_map            = pinctrl_utils_free_map,
>           |          ^~~~~~~~~~~
>     drivers/pinctrl/pinctrl-loongson2.c:216:35: warning: excess elements in struct initializer
>       216 |         .dt_free_map            = pinctrl_utils_free_map,
>           |                                   ^~~~~~~~~~~~~~~~~~~~~~
>     drivers/pinctrl/pinctrl-loongson2.c:216:35: note: (near initialization for 'loongson2_pctrl_ops')
>     drivers/pinctrl/pinctrl-loongson2.c:217:10: error: 'const struct pinctrl_ops' has no member named 'pin_dbg_show'
>       217 |         .pin_dbg_show           = loongson2_pin_dbg_show,
>           |          ^~~~~~~~~~~~
>     drivers/pinctrl/pinctrl-loongson2.c:217:35: warning: excess elements in struct initializer
>       217 |         .pin_dbg_show           = loongson2_pin_dbg_show,
>           |                                   ^~~~~~~~~~~~~~~~~~~~~~
>     drivers/pinctrl/pinctrl-loongson2.c:217:35: note: (near initialization for 'loongson2_pctrl_ops')
>     drivers/pinctrl/pinctrl-loongson2.c: In function 'loongson2_pmx_set_mux':
>     drivers/pinctrl/pinctrl-loongson2.c:223:43: error: implicit declaration of function 'pinctrl_dev_get_drvdata'; did you mean 'dev_get_drvdata'? [-Werror=implicit-function-declaration]
>       223 |         struct loongson2_pinctrl *pctrl = pinctrl_dev_get_drvdata(pcdev);
>           |                                           ^~~~~~~~~~~~~~~~~~~~~~~
>           |                                           dev_get_drvdata
>>> drivers/pinctrl/pinctrl-loongson2.c:223:43: warning: initialization of 'struct loongson2_pinctrl *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>     In file included from include/linux/container_of.h:5,
>                      from include/linux/list.h:5,
>                      from include/linux/module.h:12,
>                      from drivers/pinctrl/pinctrl-loongson2.c:9:
>     drivers/pinctrl/pinctrl-loongson2.c: In function 'loongson2_pinctrl_probe':
>     include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
>        16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
>           |                                                   ^
>     include/linux/compiler.h:232:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
>       232 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
>           |                                 ^~~~~~~~~~~~~~~~~
>     include/linux/kernel.h:55:59: note: in expansion of macro '__must_be_array'
>        55 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>           |                                                           ^~~~~~~~~~~~~~~
>     drivers/pinctrl/pinctrl-loongson2.c:294:35: note: in expansion of macro 'ARRAY_SIZE'
>       294 |         pctrl->desc.npins       = ARRAY_SIZE(loongson2_pctrl_pins);
>           |                                   ^~~~~~~~~~
>     drivers/pinctrl/pinctrl-loongson2.c:296:24: error: implicit declaration of function 'devm_pinctrl_register'; did you mean 'device_register'? [-Werror=implicit-function-declaration]
>       296 |         pctrl->pcdev = devm_pinctrl_register(pctrl->dev, &pctrl->desc, pctrl);
>           |                        ^~~~~~~~~~~~~~~~~~~~~
>           |                        device_register
>     drivers/pinctrl/pinctrl-loongson2.c: At top level:
>     drivers/pinctrl/pinctrl-loongson2.c:211:33: error: storage size of 'loongson2_pctrl_ops' isn't known
>       211 | static const struct pinctrl_ops loongson2_pctrl_ops = {
>           |                                 ^~~~~~~~~~~~~~~~~~~
>     drivers/pinctrl/pinctrl-loongson2.c:63:38: warning: 'loongson2_pctrl_pins' defined but not used [-Wunused-variable]
>        63 | static const struct pinctrl_pin_desc loongson2_pctrl_pins[] = {
>           |                                      ^~~~~~~~~~~~~~~~~~~~
>     cc1: some warnings being treated as errors
> 
> 
> vim +212 drivers/pinctrl/pinctrl-loongson2.c
> 
>     210	
>     211	static const struct pinctrl_ops loongson2_pctrl_ops = {
>   > 212		.get_groups_count	= loongson2_get_groups_count,
>     213		.get_group_name		= loongson2_get_group_name,
>     214		.get_group_pins		= loongson2_get_group_pins,
>     215		.dt_node_to_map		= pinconf_generic_dt_node_to_map_all,
>     216		.dt_free_map		= pinctrl_utils_free_map,
>     217		.pin_dbg_show		= loongson2_pin_dbg_show,
>     218	};
>     219	
>     220	static int loongson2_pmx_set_mux(struct pinctrl_dev *pcdev, unsigned int func_num,
>     221				      unsigned int group_num)
>     222	{
>   > 223		struct loongson2_pinctrl *pctrl = pinctrl_dev_get_drvdata(pcdev);
>     224		unsigned long reg = (unsigned long)pctrl->reg_base +
>     225					loongson2_pmx_groups[group_num].reg;
>     226		unsigned int mux_bit = loongson2_pmx_groups[group_num].bit;
>     227		unsigned int val;
>     228		unsigned long flags;
>     229	
>     230		spin_lock_irqsave(&pctrl->lock, flags);
>     231		val = readl((void *)reg);
>     232		if (func_num == 0)
>     233			val &= ~(1<<mux_bit);
>     234		else
>     235			val |= (1<<mux_bit);
>     236		writel(val, (void *)reg);
>     237		spin_unlock_irqrestore(&pctrl->lock, flags);
>     238	
>     239		return 0;
>     240	}
>     241	
> 
I was test it that base on 6.1-rc3 master branch and it is okay, but in 
pinctrl tree test that need include following head file.
--- a/drivers/pinctrl/pinctrl-loongson2.c
+++ b/drivers/pinctrl/pinctrl-loongson2.c
@@ -11,6 +11,8 @@
  #include <linux/of.h>
  #include <linux/pinctrl/pinmux.h>
  #include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/seq_file.h>
  #include <asm-generic/io.h>

BRs,
Yinbo.

