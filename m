Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F38936548C
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Apr 2021 10:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhDTIuM convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 20 Apr 2021 04:50:12 -0400
Received: from gloria.sntech.de ([185.11.138.130]:44780 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230168AbhDTIuL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 20 Apr 2021 04:50:11 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lYm4b-0004Ib-5J; Tue, 20 Apr 2021 10:49:33 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        "jay.xu@rock-chips.com" <jay.xu@rock-chips.com>
Cc:     Tao Huang <huangtao@rock-chips.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: rockchip: do coding style for mux route struct
Date:   Tue, 20 Apr 2021 10:49:32 +0200
Message-ID: <3088013.xgJ6IN8ObU@diego>
In-Reply-To: <202104201641340333294@rock-chips.com>
References: <20210406025356.534876-1-jay.xu@rock-chips.com> <15909449.hlxOUv9cDv@diego> <202104201641340333294@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Jay,

Am Dienstag, 20. April 2021, 10:41:34 CEST schrieb jay.xu@rock-chips.com:
> Do I need to send v2 with change-id abandon ?

do everything to make a Maintainer's life easier :-) .

So I guess yes and of course try to make sure it applies to the
pinctrl devel branch
[ https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel ]

and add the necessary versioning information, so that people see
which one is newer.


Heiko


> From: HeikoStübner
> Date: 2021-04-20 15:35
> To: linus.walleij; Jianqun Xu
> CC: huangtao; linux-gpio; linux-rockchip; linux-kernel; Jianqun Xu
> Subject: Re: [PATCH] pinctrl: rockchip: do coding style for mux route struct
> Hi,
>  
> Am Dienstag, 6. April 2021, 04:53:56 CEST schrieb Jianqun Xu:
> > The mux route tables take many lines for each SoC, and it will be more
> > instances for newly SoC, that makes the file size increase larger.
> > 
> > This patch only do coding style for mux route struct, by adding a new
> > definition and replace the structs by script which supplied by
> > huangtao@rock-chips.com
> > 
> > sed -i -e "
> > /static struct rockchip_mux_route_data /bcheck
> > b
> > :append-next-line
> > N
> > :check
> > /^[^;]*$/bappend-next-line
> > s/[[:blank:]]*.bank_num = \([[:digit:]]*,\)\n/\tRK_MUXROUTE_SAME(\1/g
> > s/[[:blank:]]*.pin =[[:blank:]]*0,\n/ RK_PA0,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*1,\n/ RK_PA1,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*2,\n/ RK_PA2,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*3,\n/ RK_PA3,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*4,\n/ RK_PA4,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*5,\n/ RK_PA5,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*6,\n/ RK_PA6,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*7,\n/ RK_PA7,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*8,\n/ RK_PB0,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*9,\n/ RK_PB1,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*10,\n/ RK_PB2,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*11,\n/ RK_PB3,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*12,\n/ RK_PB4,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*13,\n/ RK_PB5,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*14,\n/ RK_PB6,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*15,\n/ RK_PB7,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*16,\n/ RK_PC0,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*17,\n/ RK_PC1,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*18,\n/ RK_PC2,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*19,\n/ RK_PC3,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*20,\n/ RK_PC4,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*21,\n/ RK_PC5,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*22,\n/ RK_PC6,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*23,\n/ RK_PC7,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*24,\n/ RK_PD0,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*25,\n/ RK_PD1,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*26,\n/ RK_PD2,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*27,\n/ RK_PD3,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*28,\n/ RK_PD4,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*29,\n/ RK_PD5,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*30,\n/ RK_PD6,/g
> > s/[[:blank:]]*.pin =[[:blank:]]*31,\n/ RK_PD7,/g
> > s/[[:blank:]]*.func = \([[:digit:]]*,\)\n/ \1/g
> > s/[[:blank:]]*.route_location =[[:blank:]]*\([[:print:]]*,\)\n//g
> > s/[[:blank:]]*.route_offset = \(0x[[:xdigit:]]*,\)\n/ \1/g
> > s/[[:blank:]]*.route_val =[[:blank:]]*\([[:print:]]*\),\n/ \1),/g
> > s/\t{\n//g
> > s/\t}, {\n//g
> > s/\t},//g
> > s/[[:blank:]]*\(\/\*[[:print:]]*\*\/\)\n[[:blank:]]*RK_MUXROUTE_SAME(\([[:print:]]*\)),\n/\tRK_MUXROUTE_SAME(\2), \1\n/g
> > s/[[:blank:]]*\(\/\*[[:print:]]*\*\/\)\n[[:blank:]]*RK_MUXROUTE_SAME(\([[:print:]]*\)),/\tRK_MUXROUTE_SAME(\2), \1\n/g
> > " drivers/pinctrl/pinctrl-rockchip.c
> > 
> > Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> > Change-Id: Ifc823d9557605b9dfcc9c0455a739f04f3fce5be
>  
> Change-id should not be in here.
>  
> Somehow I remember giving this a "reviewed-by" before in some
> previous version, but my memory may be faulty, so
>  
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>  
> and of course I like this change very much ;-)
>  
>  
> Though it may be really helpful to not send these individual patches but
> instead make it part of the series and put it at the beginning.
> Tracking the order patches should get applied when they're sent individually
> can get very hard.
>  
> Heiko
>  
>  
> > ---
> >  drivers/pinctrl/pinctrl-rockchip.c | 669 +++++------------------------
> >  1 file changed, 99 insertions(+), 570 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> > index deabfbc74a01..6ba31c66ef8b 100644
> > --- a/drivers/pinctrl/pinctrl-rockchip.c
> > +++ b/drivers/pinctrl/pinctrl-rockchip.c
> > @@ -292,6 +292,25 @@ struct rockchip_pin_bank {
> >  .pull_type[3] = pull3, \
> >  }
> >  
> > +#define PIN_BANK_MUX_ROUTE_FLAGS(ID, PIN, FUNC, REG, VAL, FLAG) \
> > + { \
> > + .bank_num = ID, \
> > + .pin = PIN, \
> > + .func = FUNC, \
> > + .route_offset = REG, \
> > + .route_val = VAL, \
> > + .route_location = FLAG, \
> > + }
> > +
> > +#define RK_MUXROUTE_SAME(ID, PIN, FUNC, REG, VAL) \
> > + PIN_BANK_MUX_ROUTE_FLAGS(ID, PIN, FUNC, REG, VAL, ROCKCHIP_ROUTE_SAME)
> > +
> > +#define RK_MUXROUTE_GRF(ID, PIN, FUNC, REG, VAL) \
> > + PIN_BANK_MUX_ROUTE_FLAGS(ID, PIN, FUNC, REG, VAL, ROCKCHIP_ROUTE_GRF)
> > +
> > +#define RK_MUXROUTE_PMU(ID, PIN, FUNC, REG, VAL) \
> > + PIN_BANK_MUX_ROUTE_FLAGS(ID, PIN, FUNC, REG, VAL, ROCKCHIP_ROUTE_PMU)
> > +
> >  /**
> >   * struct rockchip_mux_recalced_data: represent a pin iomux data.
> >   * @num: bank number.
> > @@ -803,597 +822,107 @@ static void rockchip_get_recalced_mux(struct rockchip_pin_bank *bank, int pin,
> >  }
> >  
> >  static struct rockchip_mux_route_data px30_mux_route_data[] = {
> > - {
> > - /* cif-d2m0 */
> > - .bank_num = 2,
> > - .pin = 0,
> > - .func = 1,
> > - .route_offset = 0x184,
> > - .route_val = BIT(16 + 7),
> > - }, {
> > - /* cif-d2m1 */
> > - .bank_num = 3,
> > - .pin = 3,
> > - .func = 3,
> > - .route_offset = 0x184,
> > - .route_val = BIT(16 + 7) | BIT(7),
> > - }, {
> > - /* pdm-m0 */
> > - .bank_num = 3,
> > - .pin = 22,
> > - .func = 2,
> > - .route_offset = 0x184,
> > - .route_val = BIT(16 + 8),
> > - }, {
> > - /* pdm-m1 */
> > - .bank_num = 2,
> > - .pin = 22,
> > - .func = 1,
> > - .route_offset = 0x184,
> > - .route_val = BIT(16 + 8) | BIT(8),
> > - }, {
> > - /* uart2-rxm0 */
> > - .bank_num = 1,
> > - .pin = 27,
> > - .func = 2,
> > - .route_offset = 0x184,
> > - .route_val = BIT(16 + 10),
> > - }, {
> > - /* uart2-rxm1 */
> > - .bank_num = 2,
> > - .pin = 14,
> > - .func = 2,
> > - .route_offset = 0x184,
> > - .route_val = BIT(16 + 10) | BIT(10),
> > - }, {
> > - /* uart3-rxm0 */
> > - .bank_num = 0,
> > - .pin = 17,
> > - .func = 2,
> > - .route_offset = 0x184,
> > - .route_val = BIT(16 + 9),
> > - }, {
> > - /* uart3-rxm1 */
> > - .bank_num = 1,
> > - .pin = 15,
> > - .func = 2,
> > - .route_offset = 0x184,
> > - .route_val = BIT(16 + 9) | BIT(9),
> > - },
> > + RK_MUXROUTE_SAME(2, RK_PA0, 1, 0x184, BIT(16 + 7)), /* cif-d2m0 */
> > + RK_MUXROUTE_SAME(3, RK_PA3, 3, 0x184, BIT(16 + 7) | BIT(7)), /* cif-d2m1 */
> > + RK_MUXROUTE_SAME(3, RK_PC6, 2, 0x184, BIT(16 + 8)), /* pdm-m0 */
> > + RK_MUXROUTE_SAME(2, RK_PC6, 1, 0x184, BIT(16 + 8) | BIT(8)), /* pdm-m1 */
> > + RK_MUXROUTE_SAME(1, RK_PD3, 2, 0x184, BIT(16 + 10)), /* uart2-rxm0 */
> > + RK_MUXROUTE_SAME(2, RK_PB6, 2, 0x184, BIT(16 + 10) | BIT(10)), /* uart2-rxm1 */
> > + RK_MUXROUTE_SAME(0, RK_PC1, 2, 0x184, BIT(16 + 9)), /* uart3-rxm0 */
> > + RK_MUXROUTE_SAME(1, RK_PB7, 2, 0x184, BIT(16 + 9) | BIT(9)), /* uart3-rxm1 */
> >  };
> >  
> >  static struct rockchip_mux_route_data rk3128_mux_route_data[] = {
> > - {
> > - /* spi-0 */
> > - .bank_num = 1,
> > - .pin = 10,
> > - .func = 1,
> > - .route_offset = 0x144,
> > - .route_val = BIT(16 + 3) | BIT(16 + 4),
> > - }, {
> > - /* spi-1 */
> > - .bank_num = 1,
> > - .pin = 27,
> > - .func = 3,
> > - .route_offset = 0x144,
> > - .route_val = BIT(16 + 3) | BIT(16 + 4) | BIT(3),
> > - }, {
> > - /* spi-2 */
> > - .bank_num = 0,
> > - .pin = 13,
> > - .func = 2,
> > - .route_offset = 0x144,
> > - .route_val = BIT(16 + 3) | BIT(16 + 4) | BIT(4),
> > - }, {
> > - /* i2s-0 */
> > - .bank_num = 1,
> > - .pin = 5,
> > - .func = 1,
> > - .route_offset = 0x144,
> > - .route_val = BIT(16 + 5),
> > - }, {
> > - /* i2s-1 */
> > - .bank_num = 0,
> > - .pin = 14,
> > - .func = 1,
> > - .route_offset = 0x144,
> > - .route_val = BIT(16 + 5) | BIT(5),
> > - }, {
> > - /* emmc-0 */
> > - .bank_num = 1,
> > - .pin = 22,
> > - .func = 2,
> > - .route_offset = 0x144,
> > - .route_val = BIT(16 + 6),
> > - }, {
> > - /* emmc-1 */
> > - .bank_num = 2,
> > - .pin = 4,
> > - .func = 2,
> > - .route_offset = 0x144,
> > - .route_val = BIT(16 + 6) | BIT(6),
> > - },
> > + RK_MUXROUTE_SAME(1, RK_PB2, 1, 0x144, BIT(16 + 3) | BIT(16 + 4)), /* spi-0 */
> > + RK_MUXROUTE_SAME(1, RK_PD3, 3, 0x144, BIT(16 + 3) | BIT(16 + 4) | BIT(3)), /* spi-1 */
> > + RK_MUXROUTE_SAME(0, RK_PB5, 2, 0x144, BIT(16 + 3) | BIT(16 + 4) | BIT(4)), /* spi-2 */
> > + RK_MUXROUTE_SAME(1, RK_PA5, 1, 0x144, BIT(16 + 5)), /* i2s-0 */
> > + RK_MUXROUTE_SAME(0, RK_PB6, 1, 0x144, BIT(16 + 5) | BIT(5)), /* i2s-1 */
> > + RK_MUXROUTE_SAME(1, RK_PC6, 2, 0x144, BIT(16 + 6)), /* emmc-0 */
> > + RK_MUXROUTE_SAME(2, RK_PA4, 2, 0x144, BIT(16 + 6) | BIT(6)), /* emmc-1 */
> >  };
> >  
> >  static struct rockchip_mux_route_data rk3188_mux_route_data[] = {
> > - {
> > - /* non-iomuxed emmc/flash pins on flash-dqs */
> > - .bank_num = 0,
> > - .pin = 24,
> > - .func = 1,
> > - .route_location = ROCKCHIP_ROUTE_GRF,
> > - .route_offset = 0xa0,
> > - .route_val = BIT(16 + 11),
> > - }, {
> > - /* non-iomuxed emmc/flash pins on emmc-clk */
> > - .bank_num = 0,
> > - .pin = 24,
> > - .func = 2,
> > - .route_location = ROCKCHIP_ROUTE_GRF,
> > - .route_offset = 0xa0,
> > - .route_val = BIT(16 + 11) | BIT(11),
> > - },
> > + RK_MUXROUTE_SAME(0, RK_PD0, 1, 0xa0, BIT(16 + 11)), /* non-iomuxed emmc/flash pins on flash-dqs */
> > + RK_MUXROUTE_SAME(0, RK_PD0, 2, 0xa0, BIT(16 + 11) | BIT(11)), /* non-iomuxed emmc/flash pins on emmc-clk */
> >  };
> >  
> >  static struct rockchip_mux_route_data rk3228_mux_route_data[] = {
> > - {
> > - /* pwm0-0 */
> > - .bank_num = 0,
> > - .pin = 26,
> > - .func = 1,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16),
> > - }, {
> > - /* pwm0-1 */
> > - .bank_num = 3,
> > - .pin = 21,
> > - .func = 1,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16) | BIT(0),
> > - }, {
> > - /* pwm1-0 */
> > - .bank_num = 0,
> > - .pin = 27,
> > - .func = 1,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16 + 1),
> > - }, {
> > - /* pwm1-1 */
> > - .bank_num = 0,
> > - .pin = 30,
> > - .func = 2,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16 + 1) | BIT(1),
> > - }, {
> > - /* pwm2-0 */
> > - .bank_num = 0,
> > - .pin = 28,
> > - .func = 1,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16 + 2),
> > - }, {
> > - /* pwm2-1 */
> > - .bank_num = 1,
> > - .pin = 12,
> > - .func = 2,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16 + 2) | BIT(2),
> > - }, {
> > - /* pwm3-0 */
> > - .bank_num = 3,
> > - .pin = 26,
> > - .func = 1,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16 + 3),
> > - }, {
> > - /* pwm3-1 */
> > - .bank_num = 1,
> > - .pin = 11,
> > - .func = 2,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16 + 3) | BIT(3),
> > - }, {
> > - /* sdio-0_d0 */
> > - .bank_num = 1,
> > - .pin = 1,
> > - .func = 1,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16 + 4),
> > - }, {
> > - /* sdio-1_d0 */
> > - .bank_num = 3,
> > - .pin = 2,
> > - .func = 1,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16 + 4) | BIT(4),
> > - }, {
> > - /* spi-0_rx */
> > - .bank_num = 0,
> > - .pin = 13,
> > - .func = 2,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16 + 5),
> > - }, {
> > - /* spi-1_rx */
> > - .bank_num = 2,
> > - .pin = 0,
> > - .func = 2,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16 + 5) | BIT(5),
> > - }, {
> > - /* emmc-0_cmd */
> > - .bank_num = 1,
> > - .pin = 22,
> > - .func = 2,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16 + 7),
> > - }, {
> > - /* emmc-1_cmd */
> > - .bank_num = 2,
> > - .pin = 4,
> > - .func = 2,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16 + 7) | BIT(7),
> > - }, {
> > - /* uart2-0_rx */
> > - .bank_num = 1,
> > - .pin = 19,
> > - .func = 2,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16 + 8),
> > - }, {
> > - /* uart2-1_rx */
> > - .bank_num = 1,
> > - .pin = 10,
> > - .func = 2,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16 + 8) | BIT(8),
> > - }, {
> > - /* uart1-0_rx */
> > - .bank_num = 1,
> > - .pin = 10,
> > - .func = 1,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16 + 11),
> > - }, {
> > - /* uart1-1_rx */
> > - .bank_num = 3,
> > - .pin = 13,
> > - .func = 1,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16 + 11) | BIT(11),
> > - },
> > + RK_MUXROUTE_SAME(0, RK_PD2, 1, 0x50, BIT(16)), /* pwm0-0 */
> > + RK_MUXROUTE_SAME(3, RK_PC5, 1, 0x50, BIT(16) | BIT(0)), /* pwm0-1 */
> > + RK_MUXROUTE_SAME(0, RK_PD3, 1, 0x50, BIT(16 + 1)), /* pwm1-0 */
> > + RK_MUXROUTE_SAME(0, RK_PD6, 2, 0x50, BIT(16 + 1) | BIT(1)), /* pwm1-1 */
> > + RK_MUXROUTE_SAME(0, RK_PD4, 1, 0x50, BIT(16 + 2)), /* pwm2-0 */
> > + RK_MUXROUTE_SAME(1, RK_PB4, 2, 0x50, BIT(16 + 2) | BIT(2)), /* pwm2-1 */
> > + RK_MUXROUTE_SAME(3, RK_PD2, 1, 0x50, BIT(16 + 3)), /* pwm3-0 */
> > + RK_MUXROUTE_SAME(1, RK_PB3, 2, 0x50, BIT(16 + 3) | BIT(3)), /* pwm3-1 */
> > + RK_MUXROUTE_SAME(1, RK_PA1, 1, 0x50, BIT(16 + 4)), /* sdio-0_d0 */
> > + RK_MUXROUTE_SAME(3, RK_PA2, 1, 0x50, BIT(16 + 4) | BIT(4)), /* sdio-1_d0 */
> > + RK_MUXROUTE_SAME(0, RK_PB5, 2, 0x50, BIT(16 + 5)), /* spi-0_rx */
> > + RK_MUXROUTE_SAME(2, RK_PA0, 2, 0x50, BIT(16 + 5) | BIT(5)), /* spi-1_rx */
> > + RK_MUXROUTE_SAME(1, RK_PC6, 2, 0x50, BIT(16 + 7)), /* emmc-0_cmd */
> > + RK_MUXROUTE_SAME(2, RK_PA4, 2, 0x50, BIT(16 + 7) | BIT(7)), /* emmc-1_cmd */
> > + RK_MUXROUTE_SAME(1, RK_PC3, 2, 0x50, BIT(16 + 8)), /* uart2-0_rx */
> > + RK_MUXROUTE_SAME(1, RK_PB2, 2, 0x50, BIT(16 + 8) | BIT(8)), /* uart2-1_rx */
> > + RK_MUXROUTE_SAME(1, RK_PB2, 1, 0x50, BIT(16 + 11)), /* uart1-0_rx */
> > + RK_MUXROUTE_SAME(3, RK_PB5, 1, 0x50, BIT(16 + 11) | BIT(11)), /* uart1-1_rx */
> >  };
> >  
> >  static struct rockchip_mux_route_data rk3288_mux_route_data[] = {
> > - {
> > - /* edphdmi_cecinoutt1 */
> > - .bank_num = 7,
> > - .pin = 16,
> > - .func = 2,
> > - .route_offset = 0x264,
> > - .route_val = BIT(16 + 12) | BIT(12),
> > - }, {
> > - /* edphdmi_cecinout */
> > - .bank_num = 7,
> > - .pin = 23,
> > - .func = 4,
> > - .route_offset = 0x264,
> > - .route_val = BIT(16 + 12),
> > - },
> > + RK_MUXROUTE_SAME(7, RK_PC0, 2, 0x264, BIT(16 + 12) | BIT(12)), /* edphdmi_cecinoutt1 */
> > + RK_MUXROUTE_SAME(7, RK_PC7, 4, 0x264, BIT(16 + 12)), /* edphdmi_cecinout */
> >  };
> >  
> >  static struct rockchip_mux_route_data rk3308_mux_route_data[] = {
> > - {
> > - /* rtc_clk */
> > - .bank_num = 0,
> > - .pin = 19,
> > - .func = 1,
> > - .route_offset = 0x314,
> > - .route_val = BIT(16 + 0) | BIT(0),
> > - }, {
> > - /* uart2_rxm0 */
> > - .bank_num = 1,
> > - .pin = 22,
> > - .func = 2,
> > - .route_offset = 0x314,
> > - .route_val = BIT(16 + 2) | BIT(16 + 3),
> > - }, {
> > - /* uart2_rxm1 */
> > - .bank_num = 4,
> > - .pin = 26,
> > - .func = 2,
> > - .route_offset = 0x314,
> > - .route_val = BIT(16 + 2) | BIT(16 + 3) | BIT(2),
> > - }, {
> > - /* i2c3_sdam0 */
> > - .bank_num = 0,
> > - .pin = 15,
> > - .func = 2,
> > - .route_offset = 0x608,
> > - .route_val = BIT(16 + 8) | BIT(16 + 9),
> > - }, {
> > - /* i2c3_sdam1 */
> > - .bank_num = 3,
> > - .pin = 12,
> > - .func = 2,
> > - .route_offset = 0x608,
> > - .route_val = BIT(16 + 8) | BIT(16 + 9) | BIT(8),
> > - }, {
> > - /* i2c3_sdam2 */
> > - .bank_num = 2,
> > - .pin = 0,
> > - .func = 3,
> > - .route_offset = 0x608,
> > - .route_val = BIT(16 + 8) | BIT(16 + 9) | BIT(9),
> > - }, {
> > - /* i2s-8ch-1-sclktxm0 */
> > - .bank_num = 1,
> > - .pin = 3,
> > - .func = 2,
> > - .route_offset = 0x308,
> > - .route_val = BIT(16 + 3),
> > - }, {
> > - /* i2s-8ch-1-sclkrxm0 */
> > - .bank_num = 1,
> > - .pin = 4,
> > - .func = 2,
> > - .route_offset = 0x308,
> > - .route_val = BIT(16 + 3),
> > - }, {
> > - /* i2s-8ch-1-sclktxm1 */
> > - .bank_num = 1,
> > - .pin = 13,
> > - .func = 2,
> > - .route_offset = 0x308,
> > - .route_val = BIT(16 + 3) | BIT(3),
> > - }, {
> > - /* i2s-8ch-1-sclkrxm1 */
> > - .bank_num = 1,
> > - .pin = 14,
> > - .func = 2,
> > - .route_offset = 0x308,
> > - .route_val = BIT(16 + 3) | BIT(3),
> > - }, {
> > - /* pdm-clkm0 */
> > - .bank_num = 1,
> > - .pin = 4,
> > - .func = 3,
> > - .route_offset = 0x308,
> > - .route_val =  BIT(16 + 12) | BIT(16 + 13),
> > - }, {
> > - /* pdm-clkm1 */
> > - .bank_num = 1,
> > - .pin = 14,
> > - .func = 4,
> > - .route_offset = 0x308,
> > - .route_val = BIT(16 + 12) | BIT(16 + 13) | BIT(12),
> > - }, {
> > - /* pdm-clkm2 */
> > - .bank_num = 2,
> > - .pin = 6,
> > - .func = 2,
> > - .route_offset = 0x308,
> > - .route_val = BIT(16 + 12) | BIT(16 + 13) | BIT(13),
> > - }, {
> > - /* pdm-clkm-m2 */
> > - .bank_num = 2,
> > - .pin = 4,
> > - .func = 3,
> > - .route_offset = 0x600,
> > - .route_val = BIT(16 + 2) | BIT(2),
> > - }, {
> > - /* spi1_miso */
> > - .bank_num = 3,
> > - .pin = 10,
> > - .func = 3,
> > - .route_offset = 0x314,
> > - .route_val = BIT(16 + 9),
> > - }, {
> > - /* spi1_miso_m1 */
> > - .bank_num = 2,
> > - .pin = 4,
> > - .func = 2,
> > - .route_offset = 0x314,
> > - .route_val = BIT(16 + 9) | BIT(9),
> > - }, {
> > - /* owire_m0 */
> > - .bank_num = 0,
> > - .pin = 11,
> > - .func = 3,
> > - .route_offset = 0x314,
> > - .route_val = BIT(16 + 10) | BIT(16 + 11),
> > - }, {
> > - /* owire_m1 */
> > - .bank_num = 1,
> > - .pin = 22,
> > - .func = 7,
> > - .route_offset = 0x314,
> > - .route_val = BIT(16 + 10) | BIT(16 + 11) | BIT(10),
> > - }, {
> > - /* owire_m2 */
> > - .bank_num = 2,
> > - .pin = 2,
> > - .func = 5,
> > - .route_offset = 0x314,
> > - .route_val = BIT(16 + 10) | BIT(16 + 11) | BIT(11),
> > - }, {
> > - /* can_rxd_m0 */
> > - .bank_num = 0,
> > - .pin = 11,
> > - .func = 2,
> > - .route_offset = 0x314,
> > - .route_val = BIT(16 + 12) | BIT(16 + 13),
> > - }, {
> > - /* can_rxd_m1 */
> > - .bank_num = 1,
> > - .pin = 22,
> > - .func = 5,
> > - .route_offset = 0x314,
> > - .route_val = BIT(16 + 12) | BIT(16 + 13) | BIT(12),
> > - }, {
> > - /* can_rxd_m2 */
> > - .bank_num = 2,
> > - .pin = 2,
> > - .func = 4,
> > - .route_offset = 0x314,
> > - .route_val = BIT(16 + 12) | BIT(16 + 13) | BIT(13),
> > - }, {
> > - /* mac_rxd0_m0 */
> > - .bank_num = 1,
> > - .pin = 20,
> > - .func = 3,
> > - .route_offset = 0x314,
> > - .route_val = BIT(16 + 14),
> > - }, {
> > - /* mac_rxd0_m1 */
> > - .bank_num = 4,
> > - .pin = 2,
> > - .func = 2,
> > - .route_offset = 0x314,
> > - .route_val = BIT(16 + 14) | BIT(14),
> > - }, {
> > - /* uart3_rx */
> > - .bank_num = 3,
> > - .pin = 12,
> > - .func = 4,
> > - .route_offset = 0x314,
> > - .route_val = BIT(16 + 15),
> > - }, {
> > - /* uart3_rx_m1 */
> > - .bank_num = 0,
> > - .pin = 17,
> > - .func = 3,
> > - .route_offset = 0x314,
> > - .route_val = BIT(16 + 15) | BIT(15),
> > - },
> > + RK_MUXROUTE_SAME(0, RK_PC3, 1, 0x314, BIT(16 + 0) | BIT(0)), /* rtc_clk */
> > + RK_MUXROUTE_SAME(1, RK_PC6, 2, 0x314, BIT(16 + 2) | BIT(16 + 3)), /* uart2_rxm0 */
> > + RK_MUXROUTE_SAME(4, RK_PD2, 2, 0x314, BIT(16 + 2) | BIT(16 + 3) | BIT(2)), /* uart2_rxm1 */
> > + RK_MUXROUTE_SAME(0, RK_PB7, 2, 0x608, BIT(16 + 8) | BIT(16 + 9)), /* i2c3_sdam0 */
> > + RK_MUXROUTE_SAME(3, RK_PB4, 2, 0x608, BIT(16 + 8) | BIT(16 + 9) | BIT(8)), /* i2c3_sdam1 */
> > + RK_MUXROUTE_SAME(2, RK_PA0, 3, 0x608, BIT(16 + 8) | BIT(16 + 9) | BIT(9)), /* i2c3_sdam2 */
> > + RK_MUXROUTE_SAME(1, RK_PA3, 2, 0x308, BIT(16 + 3)), /* i2s-8ch-1-sclktxm0 */
> > + RK_MUXROUTE_SAME(1, RK_PA4, 2, 0x308, BIT(16 + 3)), /* i2s-8ch-1-sclkrxm0 */
> > + RK_MUXROUTE_SAME(1, RK_PB5, 2, 0x308, BIT(16 + 3) | BIT(3)), /* i2s-8ch-1-sclktxm1 */
> > + RK_MUXROUTE_SAME(1, RK_PB6, 2, 0x308, BIT(16 + 3) | BIT(3)), /* i2s-8ch-1-sclkrxm1 */
> > + RK_MUXROUTE_SAME(1, RK_PA4, 3, 0x308, BIT(16 + 12) | BIT(16 + 13)), /* pdm-clkm0 */
> > + RK_MUXROUTE_SAME(1, RK_PB6, 4, 0x308, BIT(16 + 12) | BIT(16 + 13) | BIT(12)), /* pdm-clkm1 */
> > + RK_MUXROUTE_SAME(2, RK_PA6, 2, 0x308, BIT(16 + 12) | BIT(16 + 13) | BIT(13)), /* pdm-clkm2 */
> > + RK_MUXROUTE_SAME(2, RK_PA4, 3, 0x600, BIT(16 + 2) | BIT(2)), /* pdm-clkm-m2 */
> > + RK_MUXROUTE_SAME(3, RK_PB2, 3, 0x314, BIT(16 + 9)), /* spi1_miso */
> > + RK_MUXROUTE_SAME(2, RK_PA4, 2, 0x314, BIT(16 + 9) | BIT(9)), /* spi1_miso_m1 */
> > + RK_MUXROUTE_SAME(0, RK_PB3, 3, 0x314, BIT(16 + 10) | BIT(16 + 11)), /* owire_m0 */
> > + RK_MUXROUTE_SAME(1, RK_PC6, 7, 0x314, BIT(16 + 10) | BIT(16 + 11) | BIT(10)), /* owire_m1 */
> > + RK_MUXROUTE_SAME(2, RK_PA2, 5, 0x314, BIT(16 + 10) | BIT(16 + 11) | BIT(11)), /* owire_m2 */
> > + RK_MUXROUTE_SAME(0, RK_PB3, 2, 0x314, BIT(16 + 12) | BIT(16 + 13)), /* can_rxd_m0 */
> > + RK_MUXROUTE_SAME(1, RK_PC6, 5, 0x314, BIT(16 + 12) | BIT(16 + 13) | BIT(12)), /* can_rxd_m1 */
> > + RK_MUXROUTE_SAME(2, RK_PA2, 4, 0x314, BIT(16 + 12) | BIT(16 + 13) | BIT(13)), /* can_rxd_m2 */
> > + RK_MUXROUTE_SAME(1, RK_PC4, 3, 0x314, BIT(16 + 14)), /* mac_rxd0_m0 */
> > + RK_MUXROUTE_SAME(4, RK_PA2, 2, 0x314, BIT(16 + 14) | BIT(14)), /* mac_rxd0_m1 */
> > + RK_MUXROUTE_SAME(3, RK_PB4, 4, 0x314, BIT(16 + 15)), /* uart3_rx */
> > + RK_MUXROUTE_SAME(0, RK_PC1, 3, 0x314, BIT(16 + 15) | BIT(15)), /* uart3_rx_m1 */
> >  };
> >  
> >  static struct rockchip_mux_route_data rk3328_mux_route_data[] = {
> > - {
> > - /* uart2dbg_rxm0 */
> > - .bank_num = 1,
> > - .pin = 1,
> > - .func = 2,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16) | BIT(16 + 1),
> > - }, {
> > - /* uart2dbg_rxm1 */
> > - .bank_num = 2,
> > - .pin = 1,
> > - .func = 1,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16) | BIT(16 + 1) | BIT(0),
> > - }, {
> > - /* gmac-m1_rxd0 */
> > - .bank_num = 1,
> > - .pin = 11,
> > - .func = 2,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16 + 2) | BIT(2),
> > - }, {
> > - /* gmac-m1-optimized_rxd3 */
> > - .bank_num = 1,
> > - .pin = 14,
> > - .func = 2,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16 + 10) | BIT(10),
> > - }, {
> > - /* pdm_sdi0m0 */
> > - .bank_num = 2,
> > - .pin = 19,
> > - .func = 2,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16 + 3),
> > - }, {
> > - /* pdm_sdi0m1 */
> > - .bank_num = 1,
> > - .pin = 23,
> > - .func = 3,
> > - .route_offset = 0x50,
> > - .route_val =  BIT(16 + 3) | BIT(3),
> > - }, {
> > - /* spi_rxdm2 */
> > - .bank_num = 3,
> > - .pin = 2,
> > - .func = 4,
> > - .route_offset = 0x50,
> > - .route_val =  BIT(16 + 4) | BIT(16 + 5) | BIT(5),
> > - }, {
> > - /* i2s2_sdim0 */
> > - .bank_num = 1,
> > - .pin = 24,
> > - .func = 1,
> > - .route_offset = 0x50,
> > - .route_val = BIT(16 + 6),
> > - }, {
> > - /* i2s2_sdim1 */
> > - .bank_num = 3,
> > - .pin = 2,
> > - .func = 6,
> > - .route_offset = 0x50,
> > - .route_val =  BIT(16 + 6) | BIT(6),
> > - }, {
> > - /* card_iom1 */
> > - .bank_num = 2,
> > - .pin = 22,
> > - .func = 3,
> > - .route_offset = 0x50,
> > - .route_val =  BIT(16 + 7) | BIT(7),
> > - }, {
> > - /* tsp_d5m1 */
> > - .bank_num = 2,
> > - .pin = 16,
> > - .func = 3,
> > - .route_offset = 0x50,
> > - .route_val =  BIT(16 + 8) | BIT(8),
> > - }, {
> > - /* cif_data5m1 */
> > - .bank_num = 2,
> > - .pin = 16,
> > - .func = 4,
> > - .route_offset = 0x50,
> > - .route_val =  BIT(16 + 9) | BIT(9),
> > - },
> > + RK_MUXROUTE_SAME(1, RK_PA1, 2, 0x50, BIT(16) | BIT(16 + 1)), /* uart2dbg_rxm0 */
> > + RK_MUXROUTE_SAME(2, RK_PA1, 1, 0x50, BIT(16) | BIT(16 + 1) | BIT(0)), /* uart2dbg_rxm1 */
> > + RK_MUXROUTE_SAME(1, RK_PB3, 2, 0x50, BIT(16 + 2) | BIT(2)), /* gmac-m1_rxd0 */
> > + RK_MUXROUTE_SAME(1, RK_PB6, 2, 0x50, BIT(16 + 10) | BIT(10)), /* gmac-m1-optimized_rxd3 */
> > + RK_MUXROUTE_SAME(2, RK_PC3, 2, 0x50, BIT(16 + 3)), /* pdm_sdi0m0 */
> > + RK_MUXROUTE_SAME(1, RK_PC7, 3, 0x50, BIT(16 + 3) | BIT(3)), /* pdm_sdi0m1 */
> > + RK_MUXROUTE_SAME(3, RK_PA2, 4, 0x50, BIT(16 + 4) | BIT(16 + 5) | BIT(5)), /* spi_rxdm2 */
> > + RK_MUXROUTE_SAME(1, RK_PD0, 1, 0x50, BIT(16 + 6)), /* i2s2_sdim0 */
> > + RK_MUXROUTE_SAME(3, RK_PA2, 6, 0x50, BIT(16 + 6) | BIT(6)), /* i2s2_sdim1 */
> > + RK_MUXROUTE_SAME(2, RK_PC6, 3, 0x50, BIT(16 + 7) | BIT(7)), /* card_iom1 */
> > + RK_MUXROUTE_SAME(2, RK_PC0, 3, 0x50, BIT(16 + 8) | BIT(8)), /* tsp_d5m1 */
> > + RK_MUXROUTE_SAME(2, RK_PC0, 4, 0x50, BIT(16 + 9) | BIT(9)), /* cif_data5m1 */
> >  };
> >  
> >  static struct rockchip_mux_route_data rk3399_mux_route_data[] = {
> > - {
> > - /* uart2dbga_rx */
> > - .bank_num = 4,
> > - .pin = 8,
> > - .func = 2,
> > - .route_offset = 0xe21c,
> > - .route_val = BIT(16 + 10) | BIT(16 + 11),
> > - }, {
> > - /* uart2dbgb_rx */
> > - .bank_num = 4,
> > - .pin = 16,
> > - .func = 2,
> > - .route_offset = 0xe21c,
> > - .route_val = BIT(16 + 10) | BIT(16 + 11) | BIT(10),
> > - }, {
> > - /* uart2dbgc_rx */
> > - .bank_num = 4,
> > - .pin = 19,
> > - .func = 1,
> > - .route_offset = 0xe21c,
> > - .route_val = BIT(16 + 10) | BIT(16 + 11) | BIT(11),
> > - }, {
> > - /* pcie_clkreqn */
> > - .bank_num = 2,
> > - .pin = 26,
> > - .func = 2,
> > - .route_offset = 0xe21c,
> > - .route_val = BIT(16 + 14),
> > - }, {
> > - /* pcie_clkreqnb */
> > - .bank_num = 4,
> > - .pin = 24,
> > - .func = 1,
> > - .route_offset = 0xe21c,
> > - .route_val = BIT(16 + 14) | BIT(14),
> > - },
> > + RK_MUXROUTE_SAME(4, RK_PB0, 2, 0xe21c, BIT(16 + 10) | BIT(16 + 11)), /* uart2dbga_rx */
> > + RK_MUXROUTE_SAME(4, RK_PC0, 2, 0xe21c, BIT(16 + 10) | BIT(16 + 11) | BIT(10)), /* uart2dbgb_rx */
> > + RK_MUXROUTE_SAME(4, RK_PC3, 1, 0xe21c, BIT(16 + 10) | BIT(16 + 11) | BIT(11)), /* uart2dbgc_rx */
> > + RK_MUXROUTE_SAME(2, RK_PD2, 2, 0xe21c, BIT(16 + 14)), /* pcie_clkreqn */
> > + RK_MUXROUTE_SAME(4, RK_PD0, 1, 0xe21c, BIT(16 + 14) | BIT(14)), /* pcie_clkreqnb */
> >  };
> >  
> >  static bool rockchip_get_mux_route(struct rockchip_pin_bank *bank, int pin,
> > 
>  
>  
>  
>  
>  
>  
>  
> 




