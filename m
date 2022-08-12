Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93BD959172B
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Aug 2022 00:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236313AbiHLWMy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Aug 2022 18:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236062AbiHLWMx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Aug 2022 18:12:53 -0400
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD6C0B3B29
        for <linux-gpio@vger.kernel.org>; Fri, 12 Aug 2022 15:12:51 -0700 (PDT)
Received: by mail-vk1-xa31.google.com with SMTP id r4so1137667vkf.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Aug 2022 15:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc;
        bh=/DF4Pia1lLmTj9/gc/lESRJInyLl01BjbLotq0gXEsc=;
        b=a2IiKnl5WOjfSh/1k/AWdF5DproDUdaqirS4654fJI7doTB+ZFuFu3d4uypG+ED2tG
         b9zDW87mQ/pNoaoMHVcxtlzO+2AGXwlnyqKX/WgyPeFzeh5gdsa4h7UOcjdbyMyiIWNz
         xMnddjjggNYCfVybH1fBDaQVce3d2Z+iOQgyonW4v0MJafYXQlLZQXmqJ0hCDQw2snn5
         mUc/rxZePtO5RGtDqacJHaWQY+JtSumrTfndTQaADPcdC0KZzURbPsrwTgzt2T1a6svZ
         jJfi9vBDrwaq8mCMdSw+iJKbBXFpsQPeeKd/X16cYPBDO77Gw7Bam0W7vTrk7W/iZ+Ca
         Ditw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc;
        bh=/DF4Pia1lLmTj9/gc/lESRJInyLl01BjbLotq0gXEsc=;
        b=EaNb41bYj/4+emGwYRj21JVCiUr6yTB5z+r5kM3ad+aog1QTFgXsBbHpB+PvdjADI8
         VWO2HdWwgIcQDsHdSPxlx4SkDQhTVI1xFV9heuW5Kcza/lXtfsN92kN43tpB1cnJV9ec
         deoIIP0ddIAKgU7OBh2E9Hgn2IL4ZMX2UBTtcrFf7mZoTPd1AKgAAErXnmJSWAEUVqlq
         Koow4YEGc1HDHJex4C69uM6ke1WvpIQBGfimOYuaQLsouTVPcP/OOfIZU7jP8jvPjB44
         JIqlqUvgrSvbJfLnRCunOmuiFO6bgG/utDA+q+38OI3ms41oiT6QWPEfLLS6gCVCGtR6
         HpfA==
X-Gm-Message-State: ACgBeo1Uj+IIDxu5P5LMxCc7WkQ5Thf5sTt5fiOVrfYfZhDy09quq2PU
        kkTWjIk7L2JbUY39kNdKr4U4T2pzzQ+hRjA0F9s=
X-Google-Smtp-Source: AA6agR4i1F75s4aUJlNrxFoDUMBNGIZXh0LwxUakBMo7A3/W4iSP/AJiZfzjcnXwlJT0hH3htPWYsW63Q8ntN795mpk=
X-Received: by 2002:a1f:9b57:0:b0:379:1632:8dda with SMTP id
 d84-20020a1f9b57000000b0037916328ddamr2811384vke.15.1660342370779; Fri, 12
 Aug 2022 15:12:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6122:2013:0:0:0:0 with HTTP; Fri, 12 Aug 2022 15:12:50
 -0700 (PDT)
Reply-To: payenjane100@gmail.com
From:   payen jane <gilbertoimbga@gmail.com>
Date:   Fri, 12 Aug 2022 15:12:50 -0700
Message-ID: <CAKwvTmpw1Hq_raaJSrvKi-9cXnGN4KCTUnOaNDJRqh5JrPJpfA@mail.gmail.com>
Subject: =?UTF-8?B?5oiR6ZyA6KaB5L2g55qE5biu5Yqp?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: Yes, score=7.8 required=5.0 tests=BAYES_99,BAYES_999,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:a31 listed in]
        [list.dnswl.org]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 1.0000]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 1.0000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [gilbertoimbga[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [payenjane100[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

5oiR5biM5pyb5L2g6IO955CG6Kej6L+Z5p2h5L+h5oGv77yM5Zug5Li65oiR5q2j5Zyo5L2/55So
57+76K+R57uZ5L2g5YaZ5L+h44CCDQoNCuaIkeaYr+eugMK35L2p5oGp5Lit5aOr5aSr5Lq644CC
DQoNCuWcqOe+juWbvemZhuWGm+eahOWGm+S6i+mDqOmXqOOAgue+juWbve+8jOS4gOWQjeS4reWj
q++8jDMyIOWyge+8jOaIkeaYr+adpeiHque+juWbveeUsOe6s+ilv+W3nuWFi+WIqeWkq+WFsOea
hOWNlei6q++8jOebruWJjeWcqOWIqeavlOS6muePreWKoOilv+aJp+ihjOS4gOmhueeJueauiuS7
u+WKoeOAgg0KDQrmiJHmmK/kuIDkuKrmnInniLHlv4PjgIHor5rlrp7lkozmt7Hmg4XnmoTkurrv
vIzlhbfmnInoia/lpb3nmoTlub3pu5jmhJ/vvIzmiJHllpzmrKLnu5Por4bmlrDmnIvlj4vlubbk
uobop6Pku5bku6znmoTnlJ/mtLvmlrnlvI/vvIzmiJHllpzmrKLnnIvliLDlpKfmtbfnmoTms6Lm
tpvlkozlsbHohInnmoTnvo7kuL3ku6Xlj4rlpKfoh6rnhLbmiYDmi6XmnInnmoTkuIDliIfmj5Dk
vpvjgILlvojpq5jlhbTog73mm7TlpJrlnLDkuobop6PmgqjvvIzmiJHorqTkuLrmiJHku6zlj6/k
u6Xlu7rnq4voia/lpb3nmoTllYbkuJrlj4vosIrjgIINCg0K5oiR5LiA55u05b6I5LiN5byA5b+D
77yM5Zug5Li65Yeg5bm05p2l55Sf5rS75a+55oiR5LiN5YWs5bmz77yb5oiR5ZyoIDIxDQrlsoHm
l7blpLHljrvkuobniLbmr43jgILmiJHniLbkurLnmoTlkI3lrZfmmK/luJXnibnph4zmlq/kvanm
ganlkozmiJHnmoTmr43kurLnjpvkuL3kvanmganjgILmsqHmnInkurrluK7liqnmiJHvvIzkvYbm
iJHlvojpq5jlhbTmiJHnu4jkuo7lnKjnvo7lhpvkuK3mib7liLDkuoboh6rlt7HjgIINCg0K5oiR
57uT5ama55Sf5LqG5LiA5Liq5a2p5a2Q77yM5L2G5LuW5Y675LiW5LqG77yM5Zyo5oiR5LiI5aSr
5byA5aeL6IOM5Y+b5oiR5ZCO5LiN5LmF77yM5oiR5LiN5b6X5LiN5pS+5byD5ama5ae744CCDQoN
CuaIkeS5n+W+iOW5uOi/kOWcqOaIkeeahOWbveWutue+juWbveWSjOWIqeavlOS6muePreWKoOil
v+i/memHjOaLpeacieaIkeeUn+a0u+S4remcgOimgeeahOS4gOWIh++8jOS9huayoeacieS6uue7
meaIkeW7uuiuruOAguaIkemcgOimgeS4gOS4quivmuWunueahOS6uuadpeS/oeS7u++8jOS7luS5
n+S8muW7uuiuruaIkeWmguS9leaKlei1hOaIkeeahOmSseOAguWboOS4uuaIkeaYr+aIkeeItuav
jeWcqOS7luS7rOatu+WJjeeUn+S4i+eahOWUr+S4gOS4gOS4quWls+WtqeOAgg0KDQrmiJHkuI3o
rqTor4bkvaDvvIzkvYbmiJHorqTkuLrmnInkuIDkuKrlgLzlvpfkv6Hku7vnmoTlpb3kurrvvIzk
u5blj6/ku6Xlu7rnq4vnnJ/mraPnmoTkv6Hku7vlkozoia/lpb3nmoTllYbkuJrlj4vosIrvvIzl
poLmnpzkvaDnnJ/nmoTmnInkuIDkuKror5rlrp7nmoTlkI3lrZfvvIzmiJHkuZ/mnInkuIDkupvk
uovmg4XopoHlkozkvaDliIbkuqvnm7jkv6HjgILlnKjkvaDouqvkuIrvvIzlm6DkuLrmiJHpnIDo
poHkvaDnmoTluK7liqnjgILmiJHmi6XmnInmiJHlnKjliKnmr5Tkuprnj63liqDopb/otZrliLDn
moTmgLvpop3vvIg0NzANCuS4h+e+juWFg++8ieOAguaIkeWwhuWcqOS4i+S4gOWwgeeUteWtkOmC
ruS7tuS4reWRiuivieaCqOaIkeaYr+WmguS9leWBmuWIsOeahO+8jOS4jeimgeaDiuaFjO+8jOWu
g+S7rOaYr+aXoOmjjumZqeeahO+8jOaIkei/mOWcqOS4jiBSZWQNCuacieiBlOezu+eahOS6uumB
k+S4u+S5ieWMu+eUn+eahOW4ruWKqeS4i+Wwhui/meeslOmSseWtmOWFpeS6huS4gOWutumTtuih
jOOAguaIkeW4jOacm+S9oOS7peaIkeeahOWPl+ebiuS6uui6q+S7veaOpeWPl+WfuumHke+8jOW5
tuWcqOaIkeWcqOi/memHjOWujOaIkOWQjuWmpeWWhOS/neeuoeWug++8jOW5tuiOt+W+l+aIkeea
hOWGm+S6i+mAmuihjOivge+8jOS7peS+v+WcqOS9oOeahOWbveWutuS4juS9oOS8mumdou+8m+S4
jeimgeWus+aAlemTtuihjOS8mumAmui/h+eUteaxh+Wwhui1hOmHkei9rOe7meaCqO+8jOi/meWv
ueaIkeS7rOadpeivtOWuieWFqOS4lOW/q+aNt+OAgg0KDQrnrJTorrA75oiR5LiN55+l6YGT5oiR
5Lus6KaB5Zyo6L+Z6YeM5b6F5aSa5LmF77yM5oiR55qE5ZG96L+Q77yM5Zug5Li65oiR5Zyo6L+Z
6YeM5bm45YWN5LqO5Lik5qyh54K45by56KKt5Ye777yM6L+Z5a+86Ie05oiR5a+75om+5LiA5Liq
5YC85b6X5L+h6LWW55qE5Lq65p2l5biu5Yqp5oiR5o6l5pS25ZKM5oqV6LWE5Z+66YeR77yM5Zug
5Li65oiR5bCG5p2l5Yiw5L2g55qE5Zu95a625Ye66Lqr5oqV6LWE77yM5byA5aeL5paw55Sf5rS7
77yM5LiN5YaN5b2T5YW144CCDQoNCuWmguaenOaCqOaEv+aEj+iwqOaFjuWkhOeQhu+8jOivt+Wb
nuWkjeaIkeOAguaIkeS8muWRiuivieS9oOaOpeS4i+adpeeahOa1geeoi++8jOW5tue7meS9oOWP
kemAgeabtOWkmuWFs+S6juWfuumHkeWtmOWFpemTtuihjOeahOS/oeaBr+OAguS7peWPiumTtuih
jOWwhuWmguS9leW4ruWKqeaIkeS7rOmAmui/h+eUteaxh+Wwhui1hOmHkei9rOenu+WIsOaCqOea
hOWbveWutu+8jOeUteaxh+S5n+aYr+mTtuihjOWIsOmTtuihjOeahOi9rOW4kOOAguiLpeacieWF
tOi2o+ivt+iBlOezu+acrOS6uuOAgg0K
