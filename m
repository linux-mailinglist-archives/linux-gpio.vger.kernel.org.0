Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA3F67F831
	for <lists+linux-gpio@lfdr.de>; Sat, 28 Jan 2023 14:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234490AbjA1NnE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 28 Jan 2023 08:43:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233463AbjA1NnD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Jan 2023 08:43:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3067233FA;
        Sat, 28 Jan 2023 05:43:02 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18C355A9;
        Sat, 28 Jan 2023 14:43:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674913380;
        bh=mg2QTtYoEN8yJTU9f0Qyg8++AvAue9LCNVJ0YuZygYA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AENaBXf941yU9bTQ0qseJGKrzt7+mgZeI0ufbNIbbn2k1L/v6rvKB7Utez0PIFn0B
         +qwn4iNIl+jv5zPsQJYYD4G8vjOssRXkJv8ZG5LYCJO9U1eyLLAjf3nW4YtVn7WCBq
         kfk7SmVuiEtskzy5tGRbQqeiWsmm9L0hdC4nuL0M=
Date:   Sat, 28 Jan 2023 15:42:56 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     kernel test robot <lkp@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>
Subject: Re: [PATCH v6 1/5] media: v4l2-core: Make the v4l2-core code
 enable/disable the privacy LED if present
Message-ID: <Y9UmYOJI3zvpne09@pendragon.ideasonboard.com>
References: <20230127203729.10205-2-hdegoede@redhat.com>
 <202301281534.9Z8xRsrX-lkp@intel.com>
 <17f5f57e-0003-2b6b-bfaa-18b03a6d1874@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <17f5f57e-0003-2b6b-bfaa-18b03a6d1874@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Hans,

On Sat, Jan 28, 2023 at 10:41:15AM +0100, Hans de Goede wrote:
> On 1/28/23 08:35, kernel test robot wrote:
> > Hi Hans,
> > 
> > I love your patch! Yet something to improve:
> > 
> > [auto build test ERROR on linus/master]
> > [also build test ERROR on v6.2-rc5]
> > [cannot apply to media-tree/master]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
> > patch link:    https://lore.kernel.org/r/20230127203729.10205-2-hdegoede%40redhat.com
> > patch subject: [PATCH v6 1/5] media: v4l2-core: Make the v4l2-core code enable/disable the privacy LED if present
> > config: riscv-randconfig-r026-20230123 (https://download.01.org/0day-ci/archive/20230128/202301281534.9Z8xRsrX-lkp@intel.com/config)
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install riscv cross compiling tool for clang build
> >         # apt-get install binutils-riscv64-linux-gnu
> >         # https://github.com/intel-lab-lkp/linux/commit/000ccec1824b3256e3fc1a94079bb953f19faab5
> >         git remote add linux-review https://github.com/intel-lab-lkp/linux
> >         git fetch --no-tags linux-review Hans-de-Goede/media-v4l2-core-Make-the-v4l2-core-code-enable-disable-the-privacy-LED-if-present/20230128-131233
> >         git checkout 000ccec1824b3256e3fc1a94079bb953f19faab5
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/media/v4l2-core/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All errors (new ones prefixed by >>):
> > 
> >>> drivers/media/v4l2-core/v4l2-subdev.c:1124:20: error: call to undeclared function 'led_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> >            sd->privacy_led = led_get(sd->dev, "privacy-led");
> >                              ^
> >>> drivers/media/v4l2-core/v4l2-subdev.c:1124:18: error: incompatible integer to pointer conversion assigning to 'struct led_classdev *' from 'int' [-Wint-conversion]
> >            sd->privacy_led = led_get(sd->dev, "privacy-led");
> >                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    2 errors generated.
> 
> As mentioned in the cover-letter this series depends on this immutable-branch:
> 
> https://lore.kernel.org/platform-driver-x86/Y9QGcA+9nlmOOy2d@google.com/
> 
> That branch not being present in the base used by LKP is what is causing this
> error.

The --base argument to git-format-patch will record the base commit ID
in the cover letter, that can possibly help bots getting it right.

-- 
Regards,

Laurent Pinchart
