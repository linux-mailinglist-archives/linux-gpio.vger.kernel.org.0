Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9A60539518
	for <lists+linux-gpio@lfdr.de>; Tue, 31 May 2022 18:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239183AbiEaQun (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 May 2022 12:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbiEaQum (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 May 2022 12:50:42 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B98CE8BD0A
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2022 09:50:41 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id 68so14170896vse.11
        for <linux-gpio@vger.kernel.org>; Tue, 31 May 2022 09:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=IogAKhGoBa9QPMdAgVh78qOCFlabkTOpSN00yjBwN70=;
        b=Jtmiqh59OEn3IYLF7+Iw7M6g3zooiCdps7z8cburbUr3vqpVFzgujXNxsFjBC1yHA2
         ZuqHFA4KeKIuU613QAKAG8VLR0X/cvzsxh66g+DWEr2FJfNn5zm/YQmaT9sAVPKRv/TJ
         Z25yrmIbD4UcBUV3LG5u50UhP6k3eGbkbbwyPQn+D04OL7/2VnIIiOtFSGaTXd496y2c
         32PNSQml9yQsFvR3mMGIh/5VBgLO+Vwx4qHep5QgFkpwf9eMPbi6xh11d2kUpJIAp4RO
         oBfjN2/08B4M/0K3h/vXf/iL31tp0DUN7DSGk0+YynZJyN2u+1XXyy3tMxixsqQhhMQo
         5GrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=IogAKhGoBa9QPMdAgVh78qOCFlabkTOpSN00yjBwN70=;
        b=L35LSgozSPhR078rexbCqsHTggnPwy3wKQES+zDUrm39npwcv/QNrFkJ608V4CfBZ2
         gzLAhUOZ8g662s3EyYvc78TdNKFWUYgpZIAOaqJqtcCIJ7DuJto2mjsep9E53UxtHBjl
         sQnXMFkqAm6Qtf83D3Mw/gR1UIlTOJxg1xmys7G330PC3buSTnoeDMUnP8iqfU6y/9FQ
         c1Zc/hMDxD168Ml26+rA/gmfQMDRGqSrxRmmejYrqYBYsE6Ifoy63mrHFLYcVXvKrthG
         6decovB0CfffTC5H6z0xcs7j+alLi1hrJdBiuMb47kJD0mKFMzklkH5qWkM0XMQhpA0Z
         7YdQ==
X-Gm-Message-State: AOAM531JCz4eHqHocK9y+L6881ks0bEVV0xbxoViULVEPBHNMYeg//CS
        WWnMiYfeB8ZyEAl4/CDNcalGKYKXo9KqAuD63Fs=
X-Google-Smtp-Source: ABdhPJzul6VlT04sZHDZwnB2qH/+Kv9Dw2iXF3/Tf8m0PumMfcTHF75DfXMwAwxf8EpVLL/ctD5sUBHq04qjPLnC2Yo=
X-Received: by 2002:a67:c296:0:b0:335:d300:973a with SMTP id
 k22-20020a67c296000000b00335d300973amr23980159vsj.75.1654015840784; Tue, 31
 May 2022 09:50:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a1f:98d8:0:0:0:0:0 with HTTP; Tue, 31 May 2022 09:50:40
 -0700 (PDT)
Reply-To: payenjane100@gmail.com
From:   payen jane <mominatoudiallo8@gmail.com>
Date:   Tue, 31 May 2022 09:50:40 -0700
Message-ID: <CA+e49zme9ziDT8fyf-XWsvtbBOXF=A3Mt-ngKazu_vr16cr-iA@mail.gmail.com>
Subject: =?UTF-8?B?5oiR6ZyA6KaB5L2g55qE5biu5Yqp?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: Yes, score=7.7 required=5.0 tests=BAYES_99,BAYES_999,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 1.0000]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 1.0000]
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e2b listed in]
        [list.dnswl.org]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mominatoudiallo8[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [payenjane100[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mominatoudiallo8[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
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
u+WKoeOAgg0KDQrmiJHmmK/kuIDkuKrlhYXmu6HniLHlv4PjgIHor5rlrp7lkozmt7Hmg4XnmoTk
urrvvIzlhbfmnInoia/lpb3nmoTlub3pu5jmhJ/vvIzmiJHllpzmrKLnu5Por4bmlrDmnIvlj4vl
ubbkuobop6Pku5bku6znmoTnlJ/mtLvmlrnlvI/vvIzmiJHllpzmrKLnnIvliLDlpKfmtbfnmoTm
s6LmtpvlkozlsbHohInnmoTnvo7kuL3ku6Xlj4rlpKfoh6rnhLbmiYDmi6XmnInnmoTkuIDliIfm
j5DkvpvjgILlvojpq5jlhbTog73mm7TlpJrlnLDkuobop6PmgqjvvIzmiJHorqTkuLrmiJHku6zl
j6/ku6Xlu7rnq4voia/lpb3nmoTllYbkuJrlj4vosIrjgIINCg0K5oiR5LiA55u05b6I5LiN5byA
5b+D77yM5Zug5Li65Yeg5bm05p2l55Sf5rS75a+55oiR5LiN5YWs5bmz77yb5oiR5ZyoIDIxDQrl
soHml7blpLHljrvkuobniLbmr43jgILmiJHniLbkurLnmoTlkI3lrZfmmK/luJXnibnph4zmlq/k
vanmganlkozmiJHnmoTmr43kurLnjpvkuL3kvanmganjgILmsqHmnInkurrluK7liqnmiJHvvIzk
vYbmiJHlvojpq5jlhbTmiJHnu4jkuo7lnKjnvo7lhpvkuK3mib7liLDkuoboh6rlt7HjgIINCg0K
5oiR57uT5ama55Sf5LqG5LiA5Liq5a2p5a2Q77yM5L2G5LuW5Y675LiW5LqG77yM5Zyo5oiR5LiI
5aSr5byA5aeL6IOM5Y+b5oiR5ZCO5LiN5LmF77yM5oiR5LiN5b6X5LiN5pS+5byD5ama5ae744CC
DQoNCuaIkeS5n+W+iOW5uOi/kOWcqOaIkeeahOWbveWutue+juWbveWSjOWIqeavlOS6muePreWK
oOilv+i/memHjOaLpeacieaIkeeUn+a0u+S4remcgOimgeeahOS4gOWIh++8jOS9huayoeacieS6
uue7meaIkeW7uuiuruOAguaIkemcgOimgeS4gOS4quivmuWunueahOS6uuadpeS/oeS7u++8jOS7
luS5n+S8muW7uuiuruaIkeWmguS9leaKlei1hOaIkeeahOmSseOAguWboOS4uuaIkeaYr+aIkeeI
tuavjeWcqOS7luS7rOatu+WJjeeUn+S4i+eahOWUr+S4gOS4gOS4quWls+WtqeOAgg0KDQrmiJHk
uI3orqTor4bkvaDvvIzkvYbmiJHorqTkuLrmnInkuIDkuKrlj6/ku6Xkv6Hku7vnmoTlpb3kurrv
vIzlj6/ku6Xlu7rnq4vnnJ/mraPnmoTkv6Hku7vlkozoia/lpb3nmoTllYbkuJrlj4vosIrvvIzl
poLmnpzkvaDnnJ/nmoTmnInkuIDkuKror5rlrp7nmoTlkI3lrZfvvIzmiJHkuZ/mnInkuIDkupvk
uovmg4XopoHlkozkvaDliIbkuqvnm7jkv6HjgILlnKjkvaDouqvkuIrvvIzlm6DkuLrmiJHpnIDo
poHkvaDnmoTluK7liqnjgILmiJHmi6XmnInmiJHlnKjliKnmr5Tkuprnj63liqDopb/otZrliLDn
moTmgLvpop3vvIg0NzANCuS4h+e+juWFg++8ieOAguaIkeWwhuWcqOS4i+S4gOWwgeeUteWtkOmC
ruS7tuS4reWRiuivieS9oOaIkeaYr+WmguS9leWBmuWIsOeahO+8jOS4jeimgeaDiuaFjO+8jOWu
g+S7rOaYr+aXoOmjjumZqeeahO+8jOaIkei/mOWcqOS4jiBSZWQNCuacieiBlOezu+eahOS6uumB
k+S4u+S5ieWMu+eUn+eahOW4ruWKqeS4i+Wwhui/meeslOmSseWtmOWFpeS6huS4gOWutumTtuih
jOOAguaIkeW4jOacm+S9oOS7peaIkeeahOWPl+ebiuS6uui6q+S7veaOpeWPl+WfuumHke+8jOW5
tuWcqOaIkeWcqOi/memHjOWujOaIkOWQjuWmpeWWhOS/neeuoeWug++8jOW5tuiOt+W+l+aIkeea
hOWGm+S6i+mAmuihjOivge+8jOS7peS+v+WcqOS9oOeahOWbveWutuS4juS9oOS8mumdou+8m+S4
jeimgeWus+aAlemTtuihjOS8mumAmui/h+eUteaxh+Wwhui1hOmHkei9rOe7meaCqO+8jOi/meWv
ueaIkeS7rOadpeivtOWuieWFqOS4lOW/q+aNt+OAgg0KDQrnrJTorrA75oiR5LiN55+l6YGT5oiR
5Lus6KaB5Zyo6L+Z6YeM5b6F5aSa5LmF5ZKM5oiR55qE5ZG96L+Q77yM5Zug5Li65oiR5Zyo6L+Z
6YeM5bm45YWN5LqO5Lik5qyh54K45by56KKt5Ye777yM6L+Z5a+86Ie05oiR5a+75om+5LiA5Liq
5YC85b6X5L+h6LWW55qE5Lq65p2l5biu5Yqp5oiR5o6l5pS25ZKM5oqV6LWE5Z+66YeR77yM5Zug
5Li65oiR5bCG5p2l5Yiw5L2g55qE5Zu95a625Ye66Lqr5oqV6LWE77yM5byA5aeL5paw55Sf5rS7
77yM5LiN5YaN5b2T5YW144CCDQoNCuWmguaenOaCqOaEv+aEj+iwqOaFjuWkhOeQhu+8jOivt+Wb
nuWkjeaIkeOAguaIkeS8muWRiuivieS9oOaOpeS4i+adpeeahOa1geeoi++8jOW5tue7meS9oOWP
kemAgeabtOWkmuWFs+S6juWfuumHkeWtmOWFpemTtuihjOeahOS/oeaBr+OAguS7peWPiumTtuih
jOWwhuWmguS9leW4ruWKqeaIkeS7rOmAmui/h+eUteaxh+Wwhui1hOmHkei9rOenu+WIsOaCqOea
hOWbveWutu+8jOeUteaxh+S5n+aYr+mTtuihjOWIsOmTtuihjOeahOi9rOW4kOOAguiLpeacieWF
tOi2o+ivt+iBlOezu+acrOS6uuOAgg0K
