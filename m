Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBCD79DA8
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2019 02:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728897AbfG3A5J (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 20:57:09 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:49099 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727590AbfG3A5J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 29 Jul 2019 20:57:09 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 0EFCD22007;
        Mon, 29 Jul 2019 20:57:08 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Mon, 29 Jul 2019 20:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=XPnERhW2H0wWGWtbugb+2NkxwKfRT+Z
        B/CqbqW3bjzc=; b=h1PIV3879MIbvLKd771VEtBSSBLdChbMkdBG6HYaltryFjK
        mU1OLaic4mf14xFo8ZWZzUzPe6rroi70VBY08UIX3AlZXlzh5I0CqFjw4BlcTYaW
        O4dNQHc2bJBjpdqfTWeopf8r179OhBG0R8ISxB6I7EKpyj6LdRyT+AO5mJAtuwNV
        ePUqD9lp9yh7ot9sCTzyl3eCLuSvXXtT+DLQIVs7UW4/g0k6eO79hJJRtZPWp7vC
        gDVXO/VSsgW1+UkFEXHnfYNUaZI7N65bNBnqtmq1s9AuzkO+x1BjNlppZpO40+BK
        KfIx5oXoWZDtJGM+vcOv28yo0E20PIo7HwF2BVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=XPnERh
        W2H0wWGWtbugb+2NkxwKfRT+ZB/CqbqW3bjzc=; b=rHjfhPAeXGVIKUKHK0ZtHU
        KPebvOVCz4K35x3/yIwo38Z6vHaE/DRewVuG9FQJGl1wbPCN1Djhiq5e6eAUR22e
        2+gHsZob35CnOBHa4wnZgH5bvCNlUaGCBUKOMwAb5QXn0GFlj+YbQcCjTZzdyL60
        4dNqlB8oj5u8DqN6AL03SPeBFKhGijwDuaEy0HMrKplJRJUmzCqpHlgDsuBojwRG
        wPzsfYw7LQQcnM1REKCXGmDdL3OAX+ml65J7RolnUQrxYMjBYJKc+NMV5N9VM2Uz
        pNZLbeYVURJSTNDY2bVQSeK060sJ6ePvQkrYhO3JRZgultwSPUMR77bDxKBLrUfA
        ==
X-ME-Sender: <xms:4pU_XWAnTrWrXYdqp2G9pCGl9cfD-y6t-0eaEXgYB4urZrIjx-pVCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrledvgdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
    hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
    ufhiiigvpedt
X-ME-Proxy: <xmx:4pU_XadJXpf3MrjT7KtdMHx-e5YWzp46XKN8NQDBp1KNm25P5jWbgg>
    <xmx:4pU_XbdvJPn1CD30grWzCYKFW-1gQLAf38r4KRKUxJuX5cCGU7ZyqQ>
    <xmx:4pU_XQN6nVXKotBXQvgv-BNkYhQJBPIWWZu7B0RXPSGTEWo3g5hqUA>
    <xmx:5JU_XVOINtfdY87NdCVpOsBSgkIdwDoWxJCqBiXYIiPN9OvP4B4V3g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 26AF6E00A2; Mon, 29 Jul 2019 20:57:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-736-gdfb8e44-fmstable-20190718v2
Mime-Version: 1.0
Message-Id: <9d0f2b20-e6f6-419c-a866-c4a0dd92aa63@www.fastmail.com>
In-Reply-To: <CACRpkdapypySGPrLgSMSNy1fzkca2BfMUGzf3koFWQZ-M5VOvg@mail.gmail.com>
References: <20190724081313.12934-1-andrew@aj.id.au>
 <CACRpkdapypySGPrLgSMSNy1fzkca2BfMUGzf3koFWQZ-M5VOvg@mail.gmail.com>
Date:   Tue, 30 Jul 2019 10:27:25 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Linus Walleij" <linus.walleij@linaro.org>
Cc:     linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "Lee Jones" <lee.jones@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        "Joel Stanley" <joel@jms.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: Deprecate g[45]-style compatibles
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Tue, 30 Jul 2019, at 07:23, Linus Walleij wrote:
> On Wed, Jul 24, 2019 at 10:13 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> > It's probably best if we push the three patches all through one tree rather
> > than fragmenting. Is everyone happy if Joel applies them to the aspeed tree?
> 
> If you are sure it will not collide with parallell work in the
> pinctrl tree, yes.
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> (If it does collide I'd prefer to take the pinctrl patches and fix the
> conflicts in my tree.)

Fair enough, I don't know the answer so I'll poke around. I don't really mind
where the series goes in, I just want to avoid landing only part of it if I split it up.

Andrew
