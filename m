Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 446BF711774
	for <lists+linux-gpio@lfdr.de>; Thu, 25 May 2023 21:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241062AbjEYTd7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 May 2023 15:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241918AbjEYTdy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2023 15:33:54 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3752D1A6
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2023 12:33:16 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-513fd8cc029so5152785a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2023 12:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685043084; x=1687635084;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aoD/n1LUOMZuC7QwFFlSHT9qZ41E43vFB9Zm2dcYyWo=;
        b=y24OBSfU+UjFpEQtvvk9r4gGC7AuqC2LtP14+3AUhmWEcePioEA/zenMErp8yHsJRl
         VUd7xvl9Ow+XQem45xjPpPQynt0EDiplL3wNUkbnI8D2aalFOyUO/gH6mI0v8PyHAgrJ
         NGQsCGu6XB+V+7Jyuycdayv0do1OvgphFsz2n3gXdZIgLLcG5PHfPKltrxxFhVZNqhgX
         de93naGMvZIGDKSCCbrGTLu6XF4QV5h2M20n1IuSYxyI+QWP43XByjpcn/VcS/7ccBmv
         N9nXAvXrbQp6/uiFH9a4t+SMPavZWtHBbHq8ry5j37CItdOrg12FcWlsE1seeYt/Ysdn
         7drA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685043084; x=1687635084;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aoD/n1LUOMZuC7QwFFlSHT9qZ41E43vFB9Zm2dcYyWo=;
        b=N+wggdj91OK97mTjSIJpNHc75jvYnnPoQBPlN3oAi73LAWMWyALd0ZFwaC/6dMAI1U
         1L2daCIz896UMwKAAskG/QHsauUCP+i9jinfuFlSrQVI1GgbCoYJ7Tgid1Hvy1Yl0Y4D
         LZ0qJEYiSqz1S1CqS8aWs6XIS9CO2HMUGITQS/gXJGkHAzmXalrgUrNRfRdqJPS5QVsx
         Ls7Z+v2nZxYlL3XtiifRPcfvNAXG8RAhJ5GkPBNT7X170X1vPzYLWu27QV3k6Mwxfmuu
         mCvWxvQ2e//335wQvKyQGcXBGEywfVU3jLzRlJYe3wCJcE24xzlB5qL2MkZ3ZuW5XOKe
         HDNQ==
X-Gm-Message-State: AC+VfDyLQPPlVpO+DGodMP6ObtLTMRQwOVZBcudy5M5kb3XMY1gR8osY
        QW4v1YRJpLuL3RvUrR/aBFzqqDWM64/331hJf3w=
X-Google-Smtp-Source: ACHHUZ65q4evaGSOSEF/09uQoh6l5DEscOWbzXzS8I/99s1jYQLlQ89FPR8wLnKgWZYOq2oWLVwvNQ==
X-Received: by 2002:a05:600c:230d:b0:3f6:ae3:5948 with SMTP id 13-20020a05600c230d00b003f60ae35948mr2883855wmo.33.1685042356717;
        Thu, 25 May 2023 12:19:16 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c3-20020a05600c0ac300b003f50e88ffc1sm6675515wmr.0.2023.05.25.12.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 12:19:15 -0700 (PDT)
Date:   Thu, 25 May 2023 22:19:02 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     andy.shevchenko@gmail.com,
        Wells Lu =?utf-8?B?5ZGC6Iqz6aiw?= <wells.lu@sunplus.com>,
        Wells Lu <wellslutw@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl:sunplus: Add check for kmalloc
Message-ID: <9f937bde-c908-4941-b65c-e4c303d3acae@kili.mountain>
References: <1684836688-9204-1-git-send-email-wellslutw@gmail.com>
 <ZGztCHNr1jmpFq0A@surfacebook>
 <1560e9c0e5154802ab020b9da846d65f@sphcmbx02.sunplus.com.tw>
 <ZG0V6_bUaz3Thy0q@surfacebook>
 <b9207257-b04f-ee2e-7025-015b0f22358a@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9207257-b04f-ee2e-7025-015b0f22358a@wanadoo.fr>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 23, 2023 at 10:05:49PM +0200, Christophe JAILLET wrote:
> Le 23/05/2023 à 21:37, andy.shevchenko@gmail.com a écrit :
> > Tue, May 23, 2023 at 05:39:51PM +0000, Wells Lu 呂芳騰 kirjoitti:
> > > > > Fix Smatch static checker warning:
> > > > > potential null dereference 'configs'. (kmalloc returns null)
> > 
> > ...
> > 
> > > > >   			configs = kmalloc(sizeof(*configs), GFP_KERNEL);
> > > > > +			if (!configs)
> > > > 
> > > > > +				return -ENOMEM;
> > > > 
> > > > "Fixing" by adding a memory leak is not probably a good approach.
> > > 
> > > Do you mean I need to free all memory which are allocated in this subroutine before
> > > return -ENOMEM?
> > 
> > This is my understanding of the code. But as I said... (see below)
> > 
> > ...
> > 
> > > > >   			configs = kmalloc(sizeof(*configs), GFP_KERNEL);
> > > > > +			if (!configs)
> > > > > +				return -ENOMEM;
> > > > 
> > > > Ditto.
> > 
> > ...
> > 
> > > > It might be that I'm mistaken. In this case please add an explanation why in the commit
> > > > message.
> > 
> > ^^^
> > 
> 
> Hmmm, not so sure.
> 
> Should be looked at more carefully, but
>   dt_to_map_one_config		(in /drivers/pinctrl/devicetree.c)
>     .dt_node_to_map
>       --> sppctl_dt_node_to_map
> 
> Should dt_to_map_one_config() fail, pinctrl_dt_free_maps() is called
> (see https://elixir.bootlin.com/linux/v6.4-rc1/source/drivers/pinctrl/devicetree.c#L281)

Thanks for this call tree, I don't have this file enabled in my build
so it's not easy for me to find how sppctl_dt_node_to_map() was called.

drivers/pinctrl/devicetree.c
   160                  dev_err(p->dev, "pctldev %s doesn't support DT\n",
   161                          dev_name(pctldev->dev));
   162                  return -ENODEV;
   163          }
   164          ret = ops->dt_node_to_map(pctldev, np_config, &map, &num_maps);
                                                              ^^^^
"map" isn't stored anywhere so it will be leaked.  I guess kmemleak
already figured this out.

   165          if (ret < 0)
   166                  return ret;
   167          else if (num_maps == 0) {
   168                  /*

> 
> pinctrl_dt_free_maps() calls dt_free_map(), which calls .dt_free_map, so
> pinctrl_utils_free_map()
> (see https://elixir.bootlin.com/linux/v6.4-rc1/source/drivers/pinctrl/sunplus/sppctl.c#L978)
> 
> Finally the needed kfree seem to be called from here.
> (see https://elixir.bootlin.com/linux/v6.4-rc1/source/drivers/pinctrl/pinctrl-utils.c#L119)
> 
> 
> *This should obviously be double checked*, but looks safe to me.
> 
> 
> BUT, in the same function, the of_get_parent() should be undone in case of
> error, as done at the end of the function, in the normal path.
> This one seems to be missing, should a memory allocation error occur.
> 

Yes.  There are some missing calls to of_node_put(parent); in
sppctl_dt_node_to_map().

regards,
dan carpenter

