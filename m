Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBB82D5132
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Dec 2020 04:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbgLJDQB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 22:16:01 -0500
Received: from mo-csw1516.securemx.jp ([210.130.202.155]:47784 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728657AbgLJDQB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 22:16:01 -0500
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 0BA3Df8W011928; Thu, 10 Dec 2020 12:13:41 +0900
X-Iguazu-Qid: 34tr90iprcJokcJh9V
X-Iguazu-QSIG: v=2; s=0; t=1607570021; q=34tr90iprcJokcJh9V; m=ue1X5DO76l9Ed9NyhOcclSFO4L1NFOkSfjaiDpssMro=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1510) id 0BA3DegK018871;
        Thu, 10 Dec 2020 12:13:40 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 0BA3DeP4008733;
        Thu, 10 Dec 2020 12:13:40 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 0BA3DeEm029454;
        Thu, 10 Dec 2020 12:13:40 +0900
From:   Punit Agrawal <punit1.agrawal@toshiba.co.jp>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        yuji2.ishikawa@toshiba.co.jp, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: gpio: Add bindings for Toshiba Visconti GPIO Controller
References: <20201201181406.2371881-1-nobuhiro1.iwamatsu@toshiba.co.jp>
        <20201201181406.2371881-2-nobuhiro1.iwamatsu@toshiba.co.jp>
        <87sg8n483w.fsf@kokedama.swc.toshiba.co.jp>
        <20201209163945.GA570905@robh.at.kernel.org>
Date:   Thu, 10 Dec 2020 12:13:33 +0900
In-Reply-To: <20201209163945.GA570905@robh.at.kernel.org> (Rob Herring's
        message of "Wed, 9 Dec 2020 10:39:45 -0600")
X-TSB-HOP: ON
Message-ID: <87sg8e2w0y.fsf@kokedama.swc.toshiba.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Rob Herring <robh@kernel.org> writes:

[...]

>> > +  gpio-ranges: true
>> 
>> I am not sure I have a good handle on the yaml schema definitions but
>> "gpio-ranges" feels like it should be a list of ranges not a boolean.
>> 
>> Something like -
>> 
>>     gpio-ranges:
>>       maxItems: 1
>> 
>> feels more appropriate.
>> 
>> I see both the usages in gpio bindings and for other range properties so
>> maybe it's OK. I hope Rob or somebody more knowledgeable on this can
>> clarify the usage.
>
> If you know how many (or a range) entries there are for gpio-ranges, 
> then maxItems is good. If you don't, then 'gpio-ranges: true' is fine. 
> That doesn't make the property a boolean, but just says the property can 
> be present.

Makes sense. Thanks for the explanation.

[...]

