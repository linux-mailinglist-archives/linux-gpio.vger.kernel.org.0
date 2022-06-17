Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D501054F043
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 06:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379122AbiFQEcN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 00:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiFQEcL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 00:32:11 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A6D3663DC
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jun 2022 21:32:11 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id C2C385C00D9;
        Fri, 17 Jun 2022 00:32:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 17 Jun 2022 00:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1655440328; x=
        1655526728; bh=mlsoKVlXqPqeY2AbABBxaZnMTRS2pQThx4lkvWjNiOs=; b=i
        uZwVvSSZy5wTKUuK1m07bF5k9hJ5YFDzBOQ4c9qxkp05xwZywnPn+SBQN2fFIACp
        BLEF3D9oob2xxaMDmM4oG4j/34/FYxjWcwBNgISvoWB/DFTDejupTxFZMnZb0bw5
        RJH9cKw0/mCNwzxmJf9M0PjbkXMQRlyqsTQrMDFhDwuIkknXpRWKRgrs6pQOf7+o
        CJPmIKkoWqhtYry+vaFsx2X+sFZ7TGU7r2BtGxN11P6+wf+vr/Q+LJRQV2nVVfvY
        Vl64Y4Ovh4QPTqGPvn0xmJDBcITi9LfEm0njYXR2praSR4MmTNOjJDn0ZE6szkRg
        54wOjLnppHu3vD4pVPk5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655440328; x=
        1655526728; bh=mlsoKVlXqPqeY2AbABBxaZnMTRS2pQThx4lkvWjNiOs=; b=P
        pwOp6xShACMLwjWypLIetU0ii+2klmtU8itRDkkrfZ/dugG1upe0d0PuuJJaO4Ns
        JjhYyWqjH+JJ8Q+pckIBOXAvvMhTMNhNeXbr930Dw20Xh/Nnl7O0h4u4v7PZc0me
        NPJzvioaxoyB0QfUTqCoYaAfYSjLhvpc68c1kJsaeWBaX5RU/oZFnWzFfGAin+Ot
        i+NedrCOrkhPA3xw1PweCcS1Eeda2ZjpGopg+RA3MSCLlk1YG/XQPXHRernqU1B+
        CHZpJKwyPILXrL8QISUQ05OyFyxfl8KSMLDlFzA7s2FE3mHoBXIREPwD7sE/xsLB
        emywAImNEkEEwexwo9jAg==
X-ME-Sender: <xms:yAOsYsFNbV9M1Pfh5tX2WaVY1AeQHQawhoDUKHk4V3S-Ym7AKxHY8A>
    <xme:yAOsYlWdRylfq4y1FffO1lWSKhIQ5LjFj2zOt5iFxFdNVukqbisQdiEuu0j6lJtM1
    it98LJy6iOCsBjE1g>
X-ME-Received: <xmr:yAOsYmKzlKLtiNMKAGjqT9FD6P7RlvL_FnogArmhsipC7lkjX_Z_bZ8Go4zBwdtBRwzx6Udzs6PcFJtK3XwpzMgNo5UPftICiFIRS8-8AwPYh7fi-xu41gL_vA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvgedgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvvehfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpedtvefhheehgfdvkeetffeludeuudehudeuvddtveelleekvedv
    uedviefhkeeuheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:yAOsYuHYtXHovmw6cBTmp-Rj92ZnEgmNMKpLsiXla4bWB-Ylg3wdEg>
    <xmx:yAOsYiVC9xSz-w2w8GtCVWRYJrEYb7ZBz_gulyFVorNU3mSNpSqimQ>
    <xmx:yAOsYhMEt6Puxw7EXBDmM_aRrJ7zh1cNgnyQfKZGXMJx2usIQQqtBQ>
    <xmx:yAOsYtEmVyevWqnU-xHUjvwtcYM8S8hAHdXAMPuwu4Z5V8zbvFexnQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jun 2022 00:32:07 -0400 (EDT)
Subject: Re: [PATCH] pinctrl: sunxi: sunxi_pconf_set: use correct offset
To:     =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
        Andrei Lalaev <andrey.lalaev@gmail.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Yangtao Li <frank@allwinnertech.com>,
        Maxime Ripard <mripard@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     wens@csie.org, linux-gpio@vger.kernel.org,
        linux-sunxi@lists.linux.dev
References: <20220525190423.410609-1-andrey.lalaev@gmail.com>
 <CACRpkdbfJhwee-dnkhE3=ijiLcSx8seVxoKPzyZ_n7bz=TkU7w@mail.gmail.com>
 <3106779.5fSG56mABF@kista>
From:   Samuel Holland <samuel@sholland.org>
Message-ID: <f1fd1974-3013-1622-10d5-255835f5905a@sholland.org>
Date:   Thu, 16 Jun 2022 23:32:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <3106779.5fSG56mABF@kista>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 6/15/22 10:56 AM, Jernej Škrabec wrote:
> Dne sreda, 15. junij 2022 ob 15:17:55 CEST je Linus Walleij napisal(a):
>> On Wed, May 25, 2022 at 9:08 PM Andrei Lalaev <andrey.lalaev@gmail.com> 
> wrote:
>>
>>> Some Allwinner SoCs have 2 pinctrls (PIO and R_PIO).
>>> Previous implementation used absolute pin numbering and it was incorrect
>>> for R_PIO pinctrl.
>>> It's necessary to take into account the base pin number.
>>>
>>> Fixes: 90be64e27621 ("pinctrl: sunxi: implement pin_config_set")
>>> Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
>>
>> It fixes a patch by Maxime so want Maxime to ACK this if it should be
>> applied. Paging Andre and Yangtao too, would be sad if we don't apply it
>> if it is a necessary fix.
> 
> From what I can see, this fixes makes code consistent with pattern in other 
> functions, so I think it's good.

Reviewed-by: Samuel Holland <samuel@sholland.org>

This patch looks right to me as well. It appears the subtraction was
accidentally removed in the referenced commit.

Regards,
Samuel
