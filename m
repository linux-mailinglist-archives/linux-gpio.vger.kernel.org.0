Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E74427C4EF7
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 11:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbjJKJat (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 05:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231196AbjJKJas (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 05:30:48 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77EDA91;
        Wed, 11 Oct 2023 02:30:47 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id E49215C0405;
        Wed, 11 Oct 2023 05:30:46 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 11 Oct 2023 05:30:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1697016646; x=1697103046; bh=My
        dUnUPnqP4XgOECsshcETx4T1rbtS5G02GTgyxloFc=; b=mR63FrpGWOxiA39bji
        bL87POz/TU+oMIgdhC3BK7mten8GzqVq52WEAqA+B6YcFX91pfOwTwbK37r95Hh8
        gFB4czJU64Tzgc8/0g38dQRMffuOwGH34XF825OBlX8BJrIrpFPStsTaK2fBYBFb
        99SEeS76pskMXyf4JUubM/76GRmy/iRG3QZlUCnK+0RslQAxfpNecw3xI8RIV+VQ
        DmXNEja3/6CumagKfAdxTXYMWsJ1dWKxPy1/nWgv0+qitSCGb0IgGFMeJVvlM+Ov
        +b+lRMuazAQ2JX7kQtwHdE7cPThlLQEAPmHnf14X/zTBDdhb0lIEoeL455dcJlwD
        Bd0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1697016646; x=1697103046; bh=MydUnUPnqP4Xg
        OECsshcETx4T1rbtS5G02GTgyxloFc=; b=aAdpurWhi7zXAIQm4DOLBW1tUAkyE
        BeXzteePaZRGMjQcsE+uFqK6IdI7k9WBxW4HSsoYiX4gIEd1X6TtkTHQkM0cHNwF
        P2QRxVM5pEwKpWAojF8RCqscPqo7NaYKVJXoJ6sMae7BiXSBAnambeI839AZzLW9
        37cBqeqnPxlgx05Y5zK5NbAYADks8ka4ckff8sXfabXitD1hTM3m56qnkBOXsl9P
        N1q2/3mk3fu2tNyau6padx2H2Gpy6wbfeKV+pSpJQ8xRibwpuXdH6gUFcBuxa6VK
        zbomiTpxU76dA8b2ktJ4+9p4NUQXwgJi8C+LBfscH040I1NMnHeMGF5/w==
X-ME-Sender: <xms:RWsmZcWYRcc5bVYCJgHMljeVekRBQUXx0bK7R7LMrSKcXPYAt9RLIw>
    <xme:RWsmZQkmdVOtIGPmYvR3UJfe2DR6drxpQwZnrSP0GCQYaXyRHd6tpAYdki44OkBsI
    6q3VE0fQI0R3ugPadE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrheekgddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:RWsmZQaguZ4L-9eHOW4iZOWUHxiQf6OcjyTYrLw-RVo3RKt6kpljdQ>
    <xmx:RWsmZbXyOVkoK7A1DQ_KlTQj0ImogMiD-a2jyCtNjKtQJdiStbVjJA>
    <xmx:RWsmZWm52v4WVDlloYrZITw4qh6QHXlNOhlgRWIgLycm9PMjeGZI3Q>
    <xmx:RmsmZU2gZ8ZTHa8PLabbUfn3SI5NQ-zWu8H9Jv7AGOfoo0h6zYWD8A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id A62E6B60089; Wed, 11 Oct 2023 05:30:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1019-ged83ad8595-fm-20231002.001-ged83ad85
MIME-Version: 1.0
Message-Id: <fe7cf585-622a-420e-8138-10de1cbca511@app.fastmail.com>
In-Reply-To: <2023101137-fester-rerun-5c39@gregkh>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-9-peter.griffin@linaro.org>
 <2023101111-banknote-satin-1f77@gregkh>
 <a6c57156-d3a5-4524-8ef8-6f27cf0a2c97@linaro.org>
 <2023101137-fester-rerun-5c39@gregkh>
Date:   Wed, 11 Oct 2023 11:30:25 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Tudor Ambarus" <tudor.ambarus@linaro.org>
Cc:     "Peter Griffin" <peter.griffin@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org,
        "Michael Turquette" <mturquette@baylibre.com>,
        "Conor Dooley" <conor+dt@kernel.org>,
        "Stephen Boyd" <sboyd@kernel.org>,
        "Tomasz Figa" <tomasz.figa@gmail.com>,
        "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Wim Van Sebroeck" <wim@linux-watchdog.org>,
        "Guenter Roeck" <linux@roeck-us.net>,
        "Catalin Marinas" <catalin.marinas@arm.com>,
        "Will Deacon" <will@kernel.org>, "Olof Johansson" <olof@lixom.net>,
        "Chanwoo Choi" <cw00.choi@samsung.com>, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, saravanak@google.com,
        "William McVicker" <willmcvicker@google.com>, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-watchdog@vger.kernel.org, kernel-team@android.com,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 08/20] dt-bindings: serial: samsung: Add google-gs101-uart
 compatible
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 11, 2023, at 10:57, Greg KH wrote:
> On Wed, Oct 11, 2023 at 09:49:07AM +0100, Tudor Ambarus wrote:
>> On 10/11/23 08:48, Greg KH wrote:
>> > On Tue, Oct 10, 2023 at 11:49:16PM +0100, Peter Griffin wrote:
>> >> Add dedicated google-gs101-uart compatible to the dt-schema for
>> >> representing uart of the Google Tensor gs101 SoC.
>> >>
>> >> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>> >> ---
>> >>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 2 ++
>> >>  1 file changed, 2 insertions(+)
>> >>
>> >>      oneOf:
>> >>        - items:
>> >> +          - const: google,gs101-uart
>> >>            - const: samsung,exynosautov9-uart
>> >>            - const: samsung,exynos850-uart
>> >>        - enum:
>> >>            - apple,s5l-uart
>> >>            - axis,artpec8-uart
>> >> +          - google,gs101-uart
>> > 
>> > These shouldn't be needed, just declare the device as the same as what
>> 
>> We should have SoC specific compatibles so that any further quirks or
>> incompatibilities can be easily addressed.
>
> "further" work on quirks or incompatibilities can be added when they are
> found and needed.  We don't add stuff for no good reason to the kernel.
>
>> It's not only the IP itself
>> that can differ, it's also the integration of the IP into the final
>> product that could have an influence on the behavior.
>
> This is for the Pixel 6, a device that is no longer even shipping.  The
> "final product" is long stable, so this should not be an issue.

The driver does have soc specific settings for each compatible
string, in this case it looks like it overrides the FIFO size
based on driver specific data and the order in which the
ports are probed [1]. I don't understand why the driver does
this, but my impression is that if we wanted to change it to no
longer rely on that data, we'd also need a new compatible
string.

Ideally, the actual compatible list in the DTB lists both the
specific implementation (google,gs101-uart) in order to allow
such hacks if needed, and a more generic string (e.g. 
"samsung,exynos850-uart" for an older device that is entirely
compatible) in order to not actually need driver changes.

      Arnd

[1] https://lore.kernel.org/linux-arm-kernel/20231010224928.2296997-17-peter.griffin@linaro.org/
