Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68597595CE9
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Aug 2022 15:12:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbiHPNM4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Aug 2022 09:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233810AbiHPNMy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Aug 2022 09:12:54 -0400
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4853AB2DB1;
        Tue, 16 Aug 2022 06:12:51 -0700 (PDT)
Date:   Tue, 16 Aug 2022 21:12:40 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1660655569;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EH0J9QLG9uIhK2QLFzGr9XWGFUGczHSywCj76a9xZw0=;
        b=a411d6gTN1gz7NA4jF3a9oVBe7IVQBri3cc1Wj2VGf3BsO8tqitVj17aB2Z0LXA6SEKhdy
        vgrXxi0yu4br5Iyzc3USUZSadRIS1bTBbrrCqqpcBUri5jRrvvpki86K7p9h4fZTzHMjp+
        GkKe2AqNZKyEG0r/hfe4tiYSR0Y9pLE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, tekkamanninja@gmail.com,
        corbet@lwn.net, alexs@kernel.org, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs/zh_CN: Update the translation of gpio to 6.0-rc1
Message-ID: <YvuXyKeF8MUf6vKh@bobwxc.mipc>
References: <20220816114025.4180328-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220816114025.4180328-1-siyanteng@loongson.cn>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

话说 Yanteng Si 于 2022-08-16 (二) 19:40:25 +0800 曰过：

> @@ -444,15 +476,16 @@ GPIO 实现者的框架 (可选)
>  
>  
>  控制器驱动: gpio_chip
> --------------------
> +---------------------
> +
>  在框架中每个 GPIO 控制器都包装为一个 "struct gpio_chip"，他包含了
>  该类型的每个控制器的常用信息:
>  
> - - 设置 GPIO 方向的方法
> - - 用于访问 GPIO 值的方法
> - - 告知调用其方法是否可能休眠的标志
> - - 可选的 debugfs 信息导出方法 (显示类似上拉配置一样的额外状态)
> - - 诊断标签
> +	设置 GPIO 方向的方法
> +	用于访问 GPIO 值的方法
> +	告知调用其方法是否可能休眠的标志
> +	可选的 debugfs 信息导出方法 (显示类似上拉配置一样的额外状态)
> +	诊断标签

List style problem, please use '-' or '*', or all items will be put into
one <p></p>.

Thanks,

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

