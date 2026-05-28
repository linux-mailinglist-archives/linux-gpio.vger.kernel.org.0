Return-Path: <linux-gpio+bounces-37611-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPiiLFP0F2q5WAgAu9opvQ
	(envelope-from <linux-gpio+bounces-37611-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 09:52:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 377E45EE03A
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 09:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 477A1308F352
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2026 07:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E24D34E746;
	Thu, 28 May 2026 07:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="Bqvi3nfZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3383231195C;
	Thu, 28 May 2026 07:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779954422; cv=none; b=ocnLO3ipWtN7AZH8+SKKQKvntTP7XCPPXkHzPD2Mx57GyHzzCAwiJKJssAwrGXap+14GrSI8AFf7cQVgBmL6kj9GZ8DYqGdHQ3VL7kUXN3dJZtTZ+1l2xl4FX4ak6cuamn0mqRntS8bggQ62AwgalqcV3OdGBSvepXzqKu2UtRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779954422; c=relaxed/simple;
	bh=6qhTeT731gNKzW0pmpEUXvrnT0z2djgKgqtSPHx/8Uk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=k/256hsviJtB791BnjQkQfnOINZzNeJFc8oasqB8sJfraK9XvBX9U4SZdHvdBWLCB30Hq0PTGKDIAnCBOJFqBueRzU4s0yRuXvhvosb6s1Nnhxa3cT1eDIek/D07EmpmK0Wz5a0m8b1de1vy18CpKrtZdzZDTe3bekqLUn9cVjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=Bqvi3nfZ; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=3ozmfUyjzOAnaVluC3XCx/5HQttU+rVCH
	mbdD7GWQQI=; b=Bqvi3nfZDnRXAkT1ZvM/i+6gearV9Jbtz6e5bkw6FoPVd90M+
	AcyYWjd2zYeAJ4fwaHTYtiEHIUnEybE7UF045ZJvUny7EX9akX0q6DMe3s4oIqwK
	pP9Ir/LBzvA32gHbjFsgW++0uloirpw3RZi5gGO/7YzlpVootpjr3Tsi/k=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnEkP48hdqs6YGAA--.7963S2;
	Thu, 28 May 2026 15:47:05 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 6/9] pinctrl: ultrarisc: Add UltraRISC DP1000 pinctrl
 driver
From: Jia Wang <wangjia@ultrarisc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, wangjia@ultrarisc.com, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Bartosz Golaszewski <brgl@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20260525-turbojet-theorize-3a7b49f41af0@spud>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-6-bf559589ea8a@ultrarisc.com>
 <CAD++jLn=RX2rZ33kD427wR1KBo=YPzCqFaaSot22nJL4Emn_=A@mail.gmail.com>
 <20260525-turbojet-theorize-3a7b49f41af0@spud>
Date: Thu, 28 May 2026 15:46:25 +0800
Message-Id: <177995438556.929162.1470247666821673655.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779954385; l=4818;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=6qhTeT731gNKzW0pmpEUXvrnT0z2djgKgqtSPHx/8Uk=;
 b=nUsKSsPqAlnTJeS+VvPKD9efnu6SLUq2Jbb4S96xqPFeWfu8YeofAXkii6ZIR7j8uUhAhpTqf
 oPNjge3dUaQDbyd/uHKfWr1ZvevF7T2urW0p5R7axGLjF4bWWFVQB3s
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwAnEkP48hdqs6YGAA--.7963S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCF1xArW7JF18uFyDZFyrJFb_yoWrWrW5pF
	W8Wa15KryUGF4agFWqv395uFyakrZ7Jr15tryUKryUtr95tF93WFW8W3yfZasYkrZ8Gr1U
	Za15AFya93sxArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRNJ5oDUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAAEWoWakYABgAGsA
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ultrarisc.com,none];
	R_DKIM_ALLOW(-0.20)[ultrarisc.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ultrarisc.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangjia@ultrarisc.com,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37611-lists,linux-gpio=lfdr.de];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 377E45EE03A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-05-25 11:10 +0100, Conor Dooley wrote:
> On Mon, May 25, 2026 at 11:28:51AM +0200, Linus Walleij wrote:
> > On Fri, May 15, 2026 at 3:18 AM Jia Wang via B4 Relay
> > <devnull+wangjia.ultrarisc.com@kernel.org> wrote:
> 
> > > +static int ur_legacy_parse_prop(struct pinctrl_dev *pctldev,
> > > +                               struct device_node *np,
> > > +                               const char *propname,
> > > +                               struct ur_legacy_prop_data *prop)
> > > +static const char *ur_legacy_get_function_name(const struct ur_pinctrl_match_data *match_data,
> > > +                                              u32 mode)
> > > +static int ur_legacy_conf_to_configs(struct pinctrl_dev *pctldev, u32 conf,
> > > +                                    unsigned long **configs,
> > > +                                    unsigned int *num_configs)
> > > +static int ur_legacy_add_pinconf_maps(struct pinctrl_dev *pctldev,
> > > +                                     struct pinctrl_map **map,
> > > +                                     unsigned int *reserved_maps,
> > > +                                     unsigned int *num_maps,
> > > +                                     const struct ur_legacy_prop_data *prop)
> > > +static int ur_legacy_dt_node_to_map(struct pinctrl_dev *pctldev,
> > > +                                   struct device_node *np,
> > > +                                   struct pinctrl_map **map,
> > > +                                   unsigned int *num_maps)
> > 
> > What's up with all this legacy stuff?
> > 
> > What is this a legacy of?
> > 
> > I thought this was a *new* driver so how can it be "legacy"?
> 
> Jia already agreed to drop this stuff :)
> 
> > 
> > > +static int ur_generic_dt_node_to_map(struct pinctrl_dev *pctldev,
> > > +                                    struct device_node *np_config,
> > > +                                    struct pinctrl_map **map,
> > > +                                    unsigned int *num_maps)
> > > +{
> > > +       return pinconf_generic_dt_node_to_map(pctldev, np_config, map, num_maps,
> > > +                                             PIN_MAP_TYPE_INVALID);
> > > +}
> > 
> > Hm I think Conor has new helpers for this so you don't need to wrap
> > it like this.
> 
> Yeah, although "more importantly" the new helpers mean that drivers
> shouldn't need to do things like calling these home-rolled functions in
> probe, just so that they can try to use pinconf_generic_dt_node_to_map():
> | static int ur_add_pin_groups(struct ur_pinctrl *pctldata)
> | {
> | 	for (u32 i = 0; i < pctldata->match_data->npins; i++) {
> | 		int ret;
> | 
> | 		pctldata->group_names[i] = pctldata->match_data->pins[i].name;
> | 		pctldata->group_pins[i] = pctldata->match_data->pins[i].number;
> | 
> | 		ret = pinctrl_generic_add_group(pctldata->pctl_dev, pctldata->group_names[i],
> | 						&pctldata->group_pins[i], 1, NULL);
> | 		if (ret < 0)
> | 			return dev_err_probe(pctldata->dev, ret,
> | 					     "failed to add pin group %s\n",
> | 					     pctldata->group_names[i]);
> | 	}
> | 
> | 	return 0;
> | }
> | 
> | static int ur_add_functions(struct ur_pinctrl *pctldata)
> | {
> | 	for (u32 i = 0; i < pctldata->match_data->num_functions; i++) {
> | 		const struct ur_function_desc *desc = &pctldata->match_data->functions[i];
> | 		struct pinfunction func = desc->gpio ?
> | 			PINCTRL_GPIO_PINFUNCTION(desc->name, pctldata->group_names,
> | 						 pctldata->match_data->npins) :
> | 			PINCTRL_PINFUNCTION(desc->name, pctldata->group_names,
> | 					    pctldata->match_data->npins);
> | 		int ret;
> | 
> | 		ret = pinmux_generic_add_pinfunction(pctldata->pctl_dev, &func, (void *)desc);
> | 		if (ret < 0)
> | 			return dev_err_probe(pctldata->dev, ret,
> | 					     "failed to add function %s\n",
> | 					     desc->name);
> | 	}
> | 
> | 	return 0;
> | }
> (If I had more time, I would probably go looking to see if there are
> more candidates for conversion)
> 
> Jia, the helper in question is pinctrl_generic_pins_functions_dt_node_to_map().
>

I found pinctrl_generic_pins_function_dt_node_to_map() in mainline, but
there is no pinctrl_generic_pins_functions_dt_node_to_map() as mentioned.
Did you mean the singular version, and is that the one I should use?

> Cheers,
> Conor.
> 
> Also worth pointing out that this driver has match data but only one
> supported device:
> +static const struct of_device_id ur_pinctrl_of_match[] = {
> +	{ .compatible = "ultrarisc,dp1000-pinctrl", .data = &ur_dp1000_match_data, },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ur_pinctrl_of_match);
> 

Ack, I'll remove the match data since there's only one compatible for now.

Best regards,
Jia Wang



